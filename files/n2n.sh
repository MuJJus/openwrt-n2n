#!/bin/sh

[ -n "$INCLUDE_ONLY" ] || {
        . /lib/functions.sh
        . ../netifd-proto.sh
        init_proto "$@"
}

proto_n2n_setup() {
        local cfg="$1"
        local device="n2n-$cfg"
        local supernodehost supernodeport mode ipaddr netmask mac mtu community key forwarding ip6addr ip6prefixlen
        json_get_vars supernodehost supernodeport mode ipaddr netmask mac mtu community key forwarding ip6addr ip6prefixlen

        [ -n "$supernodehost" ] && {
                for ip in $(resolveip -t 5 "$supernodehost"); do
                        ( proto_add_host_dependency "$cfg" "$ip" )
                        serv_addr=1
                done
        }
        [ -n "$serv_addr" ] || {
                echo "Could not resolve server address"
                sleep 5
                proto_setup_failed "$cfg"
                exit 1
        }

        proto_run_command "$cfg" /usr/sbin/edge -f -d "$device" -l "${supernodehost}:${supernodeport}" -a "${mode}:${ipaddr}" -s "$netmask" -c "$community" $([ -n "$key" ] && echo -k $key) $([ -n "$mac" ] && echo -m $mac) $([ -n "$mtu" ] && echo -M $mtu) $([ -n "$forwarding" ] && echo -r)

        proto_init_update "$device" 1 1
        proto_set_keep 1
        sleep 1
        proto_add_ipv4_address "$ipaddr" "$netmask"
        if [ -n "$ip6addr" ] && [ -n "$ip6prefixlen" ]; then
                ifconfig "$device" "${ip6addr}/${ip6prefixlen}"
                proto_add_ipv6_address "$ip6addr" "$ip6prefixlen"
        fi
        proto_send_update "$cfg"
}

proto_n2n_teardown() {
        local cfg="$1"
        local device="n2n-$cfg"

        proto_init_update "$device" 0
        proto_kill_command "$1"
        proto_send_update "$cfg"
}

proto_n2n_init_config() {
        no_device=1
        available=1

        proto_config_add_string "supernodehost"
        proto_config_add_int "supernodeport"
        proto_config_add_string "mode"
        proto_config_add_string "ipaddr"
        proto_config_add_string "netmask"
        proto_config_add_string "mac"
        proto_config_add_int "mtu"
        proto_config_add_string "community"
        proto_config_add_string "key"
        proto_config_add_boolean "forwarding"
        proto_config_add_string "ip6addr"
        proto_config_add_int "ip6prefixlen"
}

[ -n "$INCLUDE_ONLY" ] || {
        add_protocol n2n
}
