set(CMAKE_MODULE_PATH ${SRCDIR}/cmake)
include(${CMAKE_MODULE_PATH}/common_functions.cmake)

MacroRequired( SRCDIR )
MacroRequired( GAMENAME )

set(OUTBINNAME "client_client")
set(OUTBINDIR "${SRCDIR}/../game/${GAMENAME}/bin")
set(GENERATED_PROTO_DIR "${SRCDIR}/game/client/generated_proto")

add_definitions(-DNO_STRING_T -DCLIENT_DLL -DVECTOR -DVERSION_SAFE_STEAM_API_INTERFACES -DPROTECTED_THINGS_ENABLE)
add_definitions(-DENABLE_CHROMEHTMLWINDOW -DENABLE_STUDIO_SOFTBODY)

include_directories(${SRCDIR}/game/shared)
include_directories(./game_controls)

include(${CMAKE_MODULE_PATH}/detect_platform.cmake)
include(${CMAKE_MODULE_PATH}/source_dll_base.cmake)
include(${CMAKE_MODULE_PATH}/protobuf_builder.cmake)

TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/engine_gcmessages.proto ${GENERATED_PROTO_DIR} )
TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/netmessages.proto ${GENERATED_PROTO_DIR} )
TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/common/network_connection.proto ${GENERATED_PROTO_DIR} )
TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/gcsdk/steammessages.proto ${GENERATED_PROTO_DIR} )
TargetBuildAndAddProto( ${OUTBINNAME} ${SRCDIR}/game/shared/base_gcmessages.proto ${GENERATED_PROTO_DIR} )

#NUT stuff would go here..

if( LINUXALL )
    target_compile_options(${OUTBINNAME} PRIVATE -Wno-narrowing -Wno-ignored-attributes)
    target_link_libraries(${OUTBINNAME} rt)
endif()

#$Folder	"Source Files"
target_sources(${OUTBINNAME} PRIVATE "hl2/C_Func_Monitor.cpp")
target_sources(${OUTBINNAME} PRIVATE "geiger.cpp")
#if( NOT CSGO )
#    #$File	"history_resource.cpp"		[!$CSGO]
#endif()
target_sources(${OUTBINNAME} PRIVATE "history_resource.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_weapon.cpp")
target_sources(${OUTBINNAME} PRIVATE "train.cpp")
if( NOT CSGO )
    target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_parse_default.cpp")
endif()
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievement_saverestore.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievement_saverestore.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievementmgr.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievementmgr.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/achievements_and_stats_interface.h")
if( NOT CSGO )
    #$File	"achievement_notification_panel.cpp"		[!$CSGO]
    #$File	"achievement_notification_panel.h"			[!$CSGO]
endif()
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/activitylist.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ammodef.cpp")
target_sources(${OUTBINNAME} PRIVATE "animatedentitytextureproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "animatedoffsettextureproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "animatedtextureproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "AnimateSpecificTextureProxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/animation.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/base_playeranimstate.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseachievement.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseachievement.h")
target_sources(${OUTBINNAME} PRIVATE "baseanimatedtextureproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "baseclientrendertargets.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basecombatcharacter_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basecombatweapon_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseentity_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/basegrenade_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseparticleentity.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseplayer_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/baseviewmodel_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "beamdraw.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/beam_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/blackbox_helper.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/blackbox_helper.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/engine/iblackbox.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/bone_accessor.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/bone_merge_cache.cpp")
if( PS3 )
    #$File	"buildrenderables_PS3.cpp"			[$PS3]
endif()
target_sources(${OUTBINNAME} PRIVATE "c_ai_basehumanoid.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_ai_basenpc.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_baseanimating.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_baseanimatingoverlay.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_basecombatcharacter.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_basecombatweapon.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_basedoor.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_baseentity.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_baseflex.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_baselesson.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_baselesson.h")
target_sources(${OUTBINNAME} PRIVATE "c_baseplayer.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_basetoggle.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_basetoggle.h")
target_sources(${OUTBINNAME} PRIVATE "c_baseviewmodel.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_beamspotlight.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_breakableprop.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_colorcorrection.h")
target_sources(${OUTBINNAME} PRIVATE "c_colorcorrection.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_colorcorrectionvolume.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_dynamiclight.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_entitydissolve.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_entityfreezing.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_entityparticletrail.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_ambient_light.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_ambient_light.h")
target_sources(${OUTBINNAME} PRIVATE "c_env_cascade_light.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_cascade_light.h")
target_sources(${OUTBINNAME} PRIVATE "csm_parallel_split.h")
target_sources(${OUTBINNAME} PRIVATE "csm_parallel_split.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_fog_controller.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_particlescript.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_projectedtexture.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_projectedtexture.h")
target_sources(${OUTBINNAME} PRIVATE "c_env_screenoverlay.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_tonemap_controller.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_env_dof_controller.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_entityflame.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_fire_smoke.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_fish.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_areaportalwindow.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_breakablesurf.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_breakablesurf.h")
target_sources(${OUTBINNAME} PRIVATE "c_func_brush.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_conveyor.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_dust.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_lod.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_movelinear.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_occluder.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_reflective_glass.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_rotating.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_smokevolume.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_func_tracktrain.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_gameinstructor.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_gameinstructor.h")
target_sources(${OUTBINNAME} PRIVATE "c_gib.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_hairball.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_info_overlay_accessor.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_keyvalue_saver.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_keyvalue_saver.h")
target_sources(${OUTBINNAME} PRIVATE "c_lightglow.cpp")
target_sources(${OUTBINNAME} PRIVATE "C_MaterialModifyControl.cpp")
if( X360 OR PS3 )
    #$File	"c_memorylog.cpp"								[$X360||$PS3]
    #$File	"c_memorylog.h"									[$X360||$PS3]
endif()
if( NOT CSGO )
    target_sources(${OUTBINNAME} PRIVATE "c_mod_lesson_stubs.cpp")
endif()
target_sources(${OUTBINNAME} PRIVATE "c_movie_display.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_particle_system.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_physbox.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_physics_prop_statue.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_physics_prop_statue.h")
target_sources(${OUTBINNAME} PRIVATE "c_physicsprop.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_physmagnet.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_pixel_visibility.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_plasma.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_playerresource.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_point_camera.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_point_commentary_node.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_postprocesscontroller.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_postprocesscontroller.h")
target_sources(${OUTBINNAME} PRIVATE "c_prop_hallucination.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_props.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_props.h")
target_sources(${OUTBINNAME} PRIVATE "c_ragdoll_manager.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_rope.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_rumble.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_sceneentity.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_shadowcontrol.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_slideshow_display.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_slideshow_display.h")
target_sources(${OUTBINNAME} PRIVATE "c_soundscape.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_spatialentity.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_spatialentity.h")
target_sources(${OUTBINNAME} PRIVATE "c_spotlight_end.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_sprite.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_sprite_perfmonitor.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_sun.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_sunlightshadowcontrol.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_surfacerender.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_team.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_tesla.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_test_proxytoggle.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_triggers.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_user_message_register.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_vehicle_choreo_generic.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_vehicle_jeep.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_vguiscreen.cpp")
target_sources(${OUTBINNAME} PRIVATE "hl2/c_waterbullet.cpp")
if( NOT CSGO )
    #$File	"hl2/hud_autoaim.cpp"					[!$CSGO]
    #$File	"hl2/C_BaseHLPlayer.cpp"				[$PS3 && !$CSGO]
endif()
target_sources(${OUTBINNAME} PRIVATE "C_WaterLODControl.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_world.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/cam_thirdperson.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/cam_thirdperson.h")
target_sources(${OUTBINNAME} PRIVATE "camomaterialproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "cdll_client_int.cpp")
target_sources(${OUTBINNAME} PRIVATE "cdll_bounded_cvars.cpp")
target_sources(${OUTBINNAME} PRIVATE "cdll_bounded_cvars.h")
target_sources(${OUTBINNAME} PRIVATE "cdll_util.cpp")
target_sources(${OUTBINNAME} PRIVATE "cl_mat_stub.cpp")
target_sources(${OUTBINNAME} PRIVATE "classmap.cpp")
target_sources(${OUTBINNAME} PRIVATE "clientalphaproperty.cpp")
target_sources(${OUTBINNAME} PRIVATE "client_factorylist.cpp")
target_sources(${OUTBINNAME} PRIVATE "client_thinklist.cpp")
target_sources(${OUTBINNAME} PRIVATE "cliententitylist.cpp")
target_sources(${OUTBINNAME} PRIVATE "clientleafsystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "clientmode_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "clientshadowmgr.cpp")
target_sources(${OUTBINNAME} PRIVATE "clientsideeffects.cpp")
target_sources(${OUTBINNAME} PRIVATE "clientsideeffects_test.cpp")
target_sources(${OUTBINNAME} PRIVATE "clientsteamcontext.cpp")
target_sources(${OUTBINNAME} PRIVATE "clientsteamcontext.h")
target_sources(${OUTBINNAME} PRIVATE "colorcorrectionmgr.cpp")
target_sources(${OUTBINNAME} PRIVATE "commentary_modelviewer.cpp")
target_sources(${OUTBINNAME} PRIVATE "commentary_modelviewer.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/collisionproperty.cpp")
target_sources(${OUTBINNAME} PRIVATE "convarproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "cycleproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/death_pose.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/debugoverlay_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/decals.cpp")
target_sources(${OUTBINNAME} PRIVATE "detailobjectsystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "dummyproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/effect_dispatch_data.cpp")
target_sources(${OUTBINNAME} PRIVATE "EffectsClient.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ehandle.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/entitylist_base.cpp")
target_sources(${OUTBINNAME} PRIVATE "entityoriginmaterialproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/EntityParticleTrail_Shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/env_detail_controller.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/env_wind_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/eventlist.cpp")
target_sources(${OUTBINNAME} PRIVATE "flashlighteffect.cpp")

target_sources(${OUTBINNAME} PRIVATE "foundryhelpers_client.cpp")
target_sources(${OUTBINNAME} PRIVATE "foundryhelpers_client.h")

target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/func_ladder.cpp")
target_sources(${OUTBINNAME} PRIVATE "functionproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_blood.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_cube.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_explosion.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_fleck.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_impact.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_interpvalue.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_quad.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_shelleject.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_staticline.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_tracer.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_trail.cpp")
target_sources(${OUTBINNAME} PRIVATE "fx_water.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/game_timescale_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/game_timescale_shared.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamemovement.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamerules.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamerules_register.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/GameStats.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamestringpool.cpp")
target_sources(${OUTBINNAME} PRIVATE "gametrace_client.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/gamevars_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "glow_outline_effect.cpp")
target_sources(${OUTBINNAME} PRIVATE "glow_overlay.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hintmessage.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/hintsystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "hltvcamera.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_animationinfo.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_basechat.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_basetimer.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_bitmapnumericdisplay.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_closecaption.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_crosshair.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_element_helper.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_hintdisplay.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_locator_target.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_locator_target.h")
target_sources(${OUTBINNAME} PRIVATE "hud_msg.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_numericdisplay.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_pdump.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_redraw.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_vehicle.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_savestatus.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_subtitles.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/igamesystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "in_camera.cpp")
target_sources(${OUTBINNAME} PRIVATE "in_joystick.cpp")
target_sources(${OUTBINNAME} PRIVATE "in_main.cpp")
target_sources(${OUTBINNAME} PRIVATE "initializer.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/tier1/interpolatedvar.cpp")
target_sources(${OUTBINNAME} PRIVATE "IsNPCProxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "lampbeamproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "lamphaloproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/mapentities_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "materialproxydict.cpp")
target_sources(${OUTBINNAME} PRIVATE "mathproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "matrixproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "menu.cpp")
target_sources(${OUTBINNAME} PRIVATE "message.cpp")
target_sources(${OUTBINNAME} PRIVATE "message.h")
target_sources(${OUTBINNAME} PRIVATE "modelrendersystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "modelrendersystem.h")
target_sources(${OUTBINNAME} PRIVATE "movehelper_client.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/movevars_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_movie_display.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/multiplay_gamerules.cpp")
target_sources(${OUTBINNAME} PRIVATE "object_motion_blur_effect.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/obstacle_pushaway.cpp")
target_sources(${OUTBINNAME} PRIVATE "panelmetaclassmgr.cpp")
target_sources(${OUTBINNAME} PRIVATE "particle_collision.cpp")
target_sources(${OUTBINNAME} PRIVATE "particle_litsmokeemitter.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particle_parse.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particle_parse.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particle_property.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particle_property.h")
target_sources(${OUTBINNAME} PRIVATE "particle_proxies.cpp")
target_sources(${OUTBINNAME} PRIVATE "particle_simple3d.cpp")
target_sources(${OUTBINNAME} PRIVATE "particlemgr.cpp")
target_sources(${OUTBINNAME} PRIVATE "particles_attractor.cpp")
target_sources(${OUTBINNAME} PRIVATE "particles_ez.cpp")
target_sources(${OUTBINNAME} PRIVATE "particles_localspace.cpp")
target_sources(${OUTBINNAME} PRIVATE "particles_new.cpp")
target_sources(${OUTBINNAME} PRIVATE "particles_simple.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/particlesystemquery.cpp")
target_sources(${OUTBINNAME} PRIVATE "perfvisualbenchmark.cpp")
target_sources(${OUTBINNAME} PRIVATE "physics.cpp")
target_sources(${OUTBINNAME} PRIVATE "physics_softbody.cpp")
target_sources(${OUTBINNAME} PRIVATE "physics_main_client.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_main_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_saverestore.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/physics_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "physpropclientside.cpp")
target_sources(${OUTBINNAME} PRIVATE "playerandobjectenumerator.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/point_bonusmaps_accessor.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/point_bonusmaps_accessor.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/point_posecontroller.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/postprocess_shared.h")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/precache_register.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/predictableid.cpp")
target_sources(${OUTBINNAME} PRIVATE "prediction.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/predictioncopy.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/predictioncopy_helpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/predictioncopy_test.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/props_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "proxyentity.cpp")
target_sources(${OUTBINNAME} PRIVATE "ProxyHealth.cpp")
target_sources(${OUTBINNAME} PRIVATE "proxyplayer.cpp")
target_sources(${OUTBINNAME} PRIVATE "proxypupil.cpp")
target_sources(${OUTBINNAME} PRIVATE "ragdoll.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/ragdoll_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "recvproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "replaycamera.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/rope_helpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/saverestore.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sceneentity_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "ScreenSpaceEffects.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sequence_Transitioner.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sharedvar.h")
target_sources(${OUTBINNAME} PRIVATE "simple_keys.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/simtimer.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/singleplay_gamerules.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SoundEmitterSystem.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/soundenvelope.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/SoundParametersInternal.cpp")
target_sources(${OUTBINNAME} PRIVATE "spatialentitymgr.cpp")
target_sources(${OUTBINNAME} PRIVATE "spatialentitymgr.h")
target_sources(${OUTBINNAME} PRIVATE "splinepatch.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/Sprite.cpp")
target_sources(${OUTBINNAME} PRIVATE "spritemodel.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SpriteTrail.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/steamworks_gamestats.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/studio_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/takedamageinfo.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/teamplay_gamerules.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/teamplayroundbased_gamerules.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/test_ehandle.cpp")
target_sources(${OUTBINNAME} PRIVATE "text_message.cpp")
target_sources(${OUTBINNAME} PRIVATE "texturescrollmaterialproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "timematerialproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "toggletextureproxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/usercmd.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/usermessages.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/util_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/vehicle_viewblend_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_avatarimage.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_avatarimage.h")
target_sources(${OUTBINNAME} PRIVATE "vgui_basepanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_bitmapbutton.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_bitmapimage.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_bitmappanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_centerstringpanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_consolepanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_debugoverlaypanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_fpspanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_game_viewport.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_grid.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_int.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_loadingdiscpanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_messagechars.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_netgraphpanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_slideshow_display_screen.cpp")
target_sources(${OUTBINNAME} PRIVATE "view.cpp")
target_sources(${OUTBINNAME} PRIVATE "view_beams.cpp")
target_sources(${OUTBINNAME} PRIVATE "view_effects.cpp")
target_sources(${OUTBINNAME} PRIVATE "view_scene.cpp")
target_sources(${OUTBINNAME} PRIVATE "viewangleanim.cpp")
target_sources(${OUTBINNAME} PRIVATE "ViewConeImage.cpp")
target_sources(${OUTBINNAME} PRIVATE "viewdebug.cpp")
target_sources(${OUTBINNAME} PRIVATE "viewdebug.h")
target_sources(${OUTBINNAME} PRIVATE "viewpostprocess.cpp")
target_sources(${OUTBINNAME} PRIVATE "viewpostprocess.h")
target_sources(${OUTBINNAME} PRIVATE "viewrender.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/voice_banmgr.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/voice_status.cpp")
target_sources(${OUTBINNAME} PRIVATE "vscript_client.cpp")
target_sources(${OUTBINNAME} PRIVATE "vscript_client.h")
target_sources(${OUTBINNAME} PRIVATE "vscript_client.nut")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/vscript_shared.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/vscript_shared.h")
target_sources(${OUTBINNAME} PRIVATE "warp_overlay.cpp")
target_sources(${OUTBINNAME} PRIVATE "WaterLODMaterialProxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/weapon_parse.cpp")
target_sources(${OUTBINNAME} PRIVATE "weapon_selection.cpp")
target_sources(${OUTBINNAME} PRIVATE "weapons_resource.cpp")
target_sources(${OUTBINNAME} PRIVATE "WorldDimsProxy.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_hudvideo.cpp")
target_sources(${OUTBINNAME} PRIVATE "vgui_video.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/mp_shareddefs.cpp")
if( PS3 )
    #$File	"${SRCDIR}/common/ps3/vjobutils.cpp"					[$PS3]
endif()
target_sources(${OUTBINNAME} PRIVATE "subtitlepanel.cpp")
target_sources(${OUTBINNAME} PRIVATE "c_vote_controller.h")
target_sources(${OUTBINNAME} PRIVATE "c_vote_controller.cpp")

#$Folder	"Sixense"
#{
    target_sources(${OUTBINNAME} PRIVATE "sixense/in_sixense.cpp")
    target_sources(${OUTBINNAME} PRIVATE "sixense/in_sixense.h")
    target_sources(${OUTBINNAME} PRIVATE "sixense/in_sixense_gesture_bindings.cpp")
    target_sources(${OUTBINNAME} PRIVATE "sixense/in_sixense_gesture_bindings.h")
    target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sixense/sixense_convars.cpp")
    target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sixense/sixense_convars_extern.h")
#}

#// Files not using precompiled header cbase.h

target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/closedcaptions.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/posedebugger.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/client_class.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/compiledcaptionswap.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/collisionutils.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/crtmemdebug.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_recv.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_common.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/dt_utlvector_recv.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/filesystem_helpers.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/interpolatortypes.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/networkvar.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/randoverride.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/rope_physics.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/scratchpad3d.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/ScratchPadUtils.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/sentence.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/sheetsimulator.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/simple_physics.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/stringregistry.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/studio.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/vallocator.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/vgui_controls/vgui_controls.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/jigglebones.cpp")
target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/phonemeconverter.cpp")
target_sources(${OUTBINNAME} PRIVATE "hud_lcd.cpp")
target_sources(${OUTBINNAME} PRIVATE "in_mouse.cpp")
target_sources(${OUTBINNAME} PRIVATE "in_steamcontroller.cpp")
target_sources(${OUTBINNAME} PRIVATE "mumble.cpp")
target_sources(${OUTBINNAME} PRIVATE "rendertexture.cpp")
target_sources(${OUTBINNAME} PRIVATE "render_to_rt_helper.cpp")

target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/common/CegClientWrapper.cpp")

#$Folder	"Temporary Entities"
#{
    target_sources(${OUTBINNAME} PRIVATE "c_basetempentity.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_effects.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_impact_effects.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_movie_explosion.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_particle_fire.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_particle_smokegrenade.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_prop_vehicle.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_recipientfilter.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_smoke_trail.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_smokestack.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_steamjet.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_stickybolt.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_armorricochet.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_basebeam.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_beamentpoint.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_beaments.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_beamfollow.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_beamlaser.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_beampoints.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_beamring.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_beamringpoint.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_beamspline.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_bloodsprite.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_bloodstream.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_breakmodel.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_bspdecal.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_bubbles.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_bubbletrail.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_clientprojectile.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_decal.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_dynamiclight.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_effect_dispatch.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_energysplash.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_explosion.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_fizz.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_footprint.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_glassshatter.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_glowsprite.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_impact.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_killplayerattachments.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_largefunnel.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_legacytempents.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_muzzleflash.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_particlesystem.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_physicsprop.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_playerdecal.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_projecteddecal.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_showline.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_smoke.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_sparks.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_sprite.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_spritespray.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_te_worlddecal.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_testtraceline.cpp")
    target_sources(${OUTBINNAME} PRIVATE "c_tracer.cpp")
    target_sources(${OUTBINNAME} PRIVATE "fx.cpp")
    target_sources(${OUTBINNAME} PRIVATE "fx_discreetline.cpp")
    target_sources(${OUTBINNAME} PRIVATE "fx_envelope.cpp")
    target_sources(${OUTBINNAME} PRIVATE "fx_line.cpp")
    target_sources(${OUTBINNAME} PRIVATE "fx_sparks.cpp")
    target_sources(${OUTBINNAME} PRIVATE "particlesphererenderer.cpp")
    target_sources(${OUTBINNAME} PRIVATE "smoke_fog_overlay.cpp")
#}

#$Folder	"game_controls"
#{
    target_sources(${OUTBINNAME} PRIVATE "game_controls/baseviewport.cpp")
    target_sources(${OUTBINNAME} PRIVATE "game_controls/basemodel_panel.cpp")
    target_sources(${OUTBINNAME} PRIVATE "game_controls/basemodel_panel.h")
    target_sources(${OUTBINNAME} PRIVATE "game_controls/ClientScoreBoardDialog.cpp")
    target_sources(${OUTBINNAME} PRIVATE "game_controls/commandmenu.cpp")
    target_sources(${OUTBINNAME} PRIVATE "game_controls/intromenu.cpp")
    target_sources(${OUTBINNAME} PRIVATE "game_controls/NavProgress.cpp")
    target_sources(${OUTBINNAME} PRIVATE "game_controls/vguitextwindow.cpp")
    target_sources(${OUTBINNAME} PRIVATE "game_controls/IconPanel.cpp")
#}

#$Folder	"NextBot"
#{
    target_sources(${OUTBINNAME} PRIVATE "NextBot/C_NextBot.cpp")
    target_sources(${OUTBINNAME} PRIVATE "NextBot/C_NextBot.h")
    target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SharedFunctorUtils.cpp")
    target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/game/shared/SharedFunctorUtils.h")
#}
if( WIN32 OR POSIX )
#$Folder	"MP3" [$WINDOWS||$POSIX]
#{
    target_sources(${OUTBINNAME} PRIVATE "mp3player.cpp")
    target_sources(${OUTBINNAME} PRIVATE "mp3player.h")
#}
endif()

#$Folder	"Tool Framework"
#{
    target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/tools/bonelist.cpp")
    target_sources(${OUTBINNAME} PRIVATE "${SRCDIR}/public/tools/bonelist.h")
    target_sources(${OUTBINNAME} PRIVATE "entity_client_tools.cpp")
    target_sources(${OUTBINNAME} PRIVATE "toolframework_client.cpp")
    target_sources(${OUTBINNAME} PRIVATE "toolframework_client.h")
#}

#Linking is sloppy here and continued more in cstrike15
target_link_libraries(${OUTBINNAME} bonesetup_client choreoobjects_client mathlib_extended_client )
target_link_libraries(${OUTBINNAME} matsys_controls_client particles_client raytrace_client)
#Requires evil proprietary link to libsteam_api
if( MSVC AND CMAKE_SIZEOF_VOID_P EQUAL 4 )
	target_link_libraries(${OUTBINNAME} ${LIBPUBLIC}/steam_api.lib Winmm.lib)
elseif( MSVC AND CMAKE_SIZEOF_VOID_P EQUAL 8 )
	target_link_libraries(${OUTBINNAME} ${LIBPUBLIC}/steam_api64.lib Winmm.lib)
else()
	target_link_libraries(${OUTBINNAME} ${LIBPUBLIC}/libsteam_api.so)
endif()
target_link_libraries(${OUTBINNAME} tier3_client vgui_controls_client videocfg_client vtf_client resourcefile_client )
target_link_libraries(${OUTBINNAME} zlib png libprotobuf) #from /thirdparty
