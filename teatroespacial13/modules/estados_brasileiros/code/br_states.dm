GLOBAL_LIST_INIT(br_states, icon_states("icon/state_flags.dmi"))

proc/state2chaticon(state_code)
    if(GLOB.br_states.Find(state_code))
        return "[icon2html('icon/state_flags.dmi', world, state_code)]"
    else
        return "[icon2html('icon/state_flags.dmi', world, "unknown")]"

proc/ip2state(ipaddr)
    var/list/http_response[] = world.Export("http://ip-api.com/json/[ipaddr]")
    var/page_content = http_response["CONTENT"]
    if(page_content)
        var/list/geodata = json_decode(html_decode(file2text(page_content)))
        if(geodata["countryCode"] == "BR")
            return geodata["region"]
    return null

/client/New()
    . = ..()
    spawn if(src)
        var/estado = ip2state(src.address)
        if(estado)
            var/estado_icon = state2chaticon(estado)
            message_admins("<span class='adminnotice'>[src.ckey] entrou do estado: [estado_icon] [estado]!</span>")
