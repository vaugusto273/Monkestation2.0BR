/// To store all the different cyborg models, instead of creating that for each cyborg.
GLOBAL_LIST_EMPTY(cyborg_model_list)
/// To store all of the different base cyborg model icons, instead of creating them every time the pick_module() proc is called.
GLOBAL_LIST_EMPTY(cyborg_base_models_icon_list)
/// To store all of the different cyborg model icons, instead of creating them every time the be_transformed_to() proc is called.
GLOBAL_LIST_EMPTY(cyborg_all_models_icon_list)


#define CYBORG_ICON_CARGO 'monkestation/code/modules/cargoborg/icons/robots_cargo.dmi'
#define CYBORG_ICON_DRAKE 'monkestation/code/modules/drakeborg/icons/robots_drakes.dmi'

#define CYBORG_ICON_NEWCARGO 'monkestation/code/modules/newborg/icons/robots_cargo.dmi'
#define CYBORG_ICON_NEWCLOWN 'monkestation/code/modules/newborg/icons/robots_clown.dmi'
#define CYBORG_ICON_NEWENG 'monkestation/code/modules/newborg/icons/robots_eng.dmi'
#define CYBORG_ICON_NEWJANI 'monkestation/code/modules/newborg/icons/robots_jani.dmi'
#define CYBORG_ICON_NEWMED 'monkestation/code/modules/newborg/icons/robots_med.dmi'
#define CYBORG_ICON_NEWMINE 'monkestation/code/modules/newborg/icons/robots_mine.dmi'
#define CYBORG_ICON_NEWPK 'monkestation/code/modules/newborg/icons/robots_pk.dmi'
#define CYBORG_ICON_NEWSEC 'monkestation/code/modules/newborg/icons/robots_sec.dmi'
#define CYBORG_ICON_NEWSERV 'monkestation/code/modules/newborg/icons/robots_serv.dmi'
// #define CYBORG_ICON_NEWSYNDI 'monkestation/code/modules/newborg/icons/robots_syndi.dmi'
#define CYBORG_ICON_TALLCARGO 'monkestation/code/modules/newborg/icons/tallrobot_cargo.dmi'
#define CYBORG_ICON_TALLCLOWN 'monkestation/code/modules/newborg/icons/tallrobot_clown.dmi'
#define CYBORG_ICON_TALLENG 'monkestation/code/modules/newborg/icons/tallrobot_eng.dmi'
#define CYBORG_ICON_TALLJANI 'monkestation/code/modules/newborg/icons/tallrobot_jani.dmi'
#define CYBORG_ICON_TALLMED 'monkestation/code/modules/newborg/icons/tallrobot_med.dmi'
#define CYBORG_ICON_TALLMINE 'monkestation/code/modules/newborg/icons/tallrobot_mine.dmi'
#define CYBORG_ICON_TALLPK 'monkestation/code/modules/newborg/icons/tallrobot_pk.dmi'
#define CYBORG_ICON_TALLSEC 'monkestation/code/modules/newborg/icons/tallrobot_sec.dmi'
#define CYBORG_ICON_TALLSERV 'monkestation/code/modules/newborg/icons/tallrobot_serv.dmi'
// #define CYBORG_ICON_TALLSYNDI 'monkestation/code/modules/newborg/icons/tallrobot_syndi.dmi'
// #define CYBORG_ICON_WIDEENG 'monkestation/code/modules/newborg/icons/widerobot_eng.dmi'
// #define CYBORG_ICON_WIDEJANI 'monkestation/code/modules/newborg/icons/widerobot_jani.dmi'
// #define CYBORG_ICON_WIDEMED 'monkestation/code/modules/newborg/icons/widerobot_med.dmi'
// #define CYBORG_ICON_WIDEMINE 'monkestation/code/modules/newborg/icons/widerobot_mine.dmi'
// #define CYBORG_ICON_WIDEPK 'monkestation/code/modules/newborg/icons/widerobot_pk.dmi'
// #define CYBORG_ICON_WIDESEC 'monkestation/code/modules/newborg/icons/widerobot_sec.dmi'
// #define CYBORG_ICON_WIDESERV 'monkestation/code/modules/newborg/icons/widerobot_serv.dmi'
// #define CYBORG_ICON_WIDECARGO 'monkestation/code/modules/newborg/icons/widerobots_cargo.dmi'

/// Module is compatible with Cargo Cyborg model
#define BORG_MODEL_CARGO (BORG_MODEL_ENGINEERING<<1)
#define RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_CARGO "/Cargo Cyborgs"
