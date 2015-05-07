
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name emb3_board_test -dir "/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/planAhead_run_1" -part xc6slx45fgg484-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test} }
add_files [list {/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/MicroBlaze_axi4lite_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/MicroBlaze_microblaze_0_ilmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/MicroBlaze.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/MicroBlaze_microblaze_0_dlmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/MicroBlaze_microblaze_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {/home/ignaciotb/Documents/Semester2/EMB3/VHDL/EMB3-PROJECT/emb3_board_test/MicroBlaze_clock_generator_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "rmemb3_xc6slx45_master.ucf" [current_fileset -constrset]
add_files [list {rmemb3_xc6slx45_master.ucf}] -fileset [get_property constrset [current_run]]
link_design
