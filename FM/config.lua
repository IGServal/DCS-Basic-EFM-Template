-- BEGIN -- this part of the file is not intended for an end-user editing, but forget about that :) 
--[[ --------------------------------------------------------------- ]]--

-- damage_omega = 30.0, -- (deg?) speed threshold of jamming during impact of rotation limiter
-- state_angle_0 = 6.131341662, -- (deg?) designed angle of retracted gear with horizontal axis of plane
-- state_angle_1 = -2.995164152, -- (deg?) designed angle of released gear with vertical axis of plane
-- mount_pivot_x = -0.274, -- (m) X-coordinate of attachment to fuselage in body-axis system
-- mount_post_radius = 0.657, -- (m) distance from strut-axis to attachment point of piston to gear stand
-- mount_length = 0.604555117, -- (m) What is the difference between this and the post_radius? length of angle brace in retracted configuration
-- mount_angle_1 = -3.138548523, -- (deg?) length of Position (vector) from attachment point
-- post_length = 1.748, -- (m) distance from rotation-axis of strut to wheel-axis
-- wheel_axle_offset = 0.05, -- (m) displacement wheel axis relative to strut
-- self_attitude = false, -- true if gear is self-oriented (Alba or Yak-52 example)

-- amortizer_min_length = 0.0, -- (m) rate of (minimum spring lenght / minimum length of damper)
-- amortizer_max_length = 0.397, -- (m) same as previous but max length
-- amortizer_basic_length = 0.397, -- (m) rate of (spring length in free (without load) condition / damper length in free (without load) condition)
-- amortizer_spring_force_factor = 1.6e+13, -- (???) spring tension factor
-- amortizer_spring_force_factor_rate = 20.0, -- (???)
-- amortizer_static_force = 80000.0, -- (N?) static reaction force of damper
-- amortizer_reduce_length = 0.377, -- (m) total suspension compression distance in non-load condition
-- amortizer_direct_damper_force_factor = 45000.0, -- (???) damper of positive movement
-- amortizer_back_damper_force_factor = 15000.0, -- (???) damper of negative (reversed) movement

-- wheel_radius = 0.308, -- (m) Tire radius
-- wheel_static_friction_factor = 0.65 , -- (unitless) Static friction factor when wheel not moves
-- wheel_roll_friction_factor = 0.025, -- (unitless) Rolling friction factor when wheel not moves
-- wheel_damage_force_factor = 250.0, --wheel cover (tire) strength force (not sure)
-- wheel_brake_moment_max = 15000, -- (N-m) Max braking moment torque 

FM = {
center_of_mass		= {-0.6 ,  0,	   0},--x,y,z
	 moment_of_inertia 	= {38912  ,254758,223845,-705},--Ix,Iy,Iz,Ixy
	suspension 			= {
		 {--Nose wheel
			mass = 100,
			pos   			  = {3.85, -1.12, 0},
						
			 damage_element = 0, 
			 self_attitude = true,
			 wheel_axle_offset = 0.14,
			 yaw_limit = math.rad(60.0),
			 damper_coeff = 400.0, 
			 allowable_hard_contact_length	= 0.19,				

			  amortizer_max_length     = 0.53,
			  amortizer_basic_length   = 0.53,
			  amortizer_reduce_length  = 0.53, --0.43
			  
			  amortizer_spring_force_factor   = 990000.0, -- force = spring_force_factor * pow(reduce_length, amortizer_spring_force_factor_rate
			  amortizer_spring_force_factor_rate  = 1,
			  amortizer_static_force     = 47500.0,
			  
			  amortizer_direct_damper_force_factor = 50000,
			  amortizer_back_damper_force_factor  = 60000,

			  anti_skid_installed = true,

			  wheel_radius      = 0.64,
			  wheel_static_friction_factor  = 0.75 ,
			  -- wheel_side_friction_factor    = 0.85,--0.85 ,
			  wheel_roll_friction_factor    = 0.08 ,
			  wheel_glide_friction_factor   = 0.65 ,
			  wheel_damage_force_factor     = 450.0,
			  
				wheel_moment_of_inertia   = 0.15, --wheel moi as rotation body

				wheel_brake_moment_max = 50.0, -- maximum value of braking moment  , N*m 
				
				arg_post			  = 0,
				arg_amortizer		  = 1,
				arg_wheel_rotation    = 101,
				arg_wheel_rotation    = 76,
				arg_wheel_yaw		  = 2,
				collision_shell_name  = "WHEEL_F",
				 arg_wheel_damage   = 134,
			},
		{--Left wheel
		mass = 200,
		 -- pos   			  = {-0.656,	-2.378,	2.183},
		 pos   			  = {-1.51, -1.09, -1.35 },
		damage_element	    = 3,
		wheel_axle_offset 	= 0.38,
		self_attitude	    = false,
		yaw_limit		    = math.rad(0.0),
		damper_coeff	    = 160.0,
		
		  amortizer_max_length     = 0.4  , 
		  amortizer_basic_length   = 0.4  ,
		  amortizer_reduce_length  = 0.4  ,
		  
		  amortizer_spring_force_factor   = 50000.0, -- 29370398.0 or 10000 -- force = spring_force_factor * pow(reduce_length, amortizer_spring_force_factor_rate
		  amortizer_spring_force_factor_rate  = 3,
		  amortizer_static_force     = 202394.0, 
		  amortizer_direct_damper_force_factor = 150000.0,
		  amortizer_back_damper_force_factor  = 125000.0,
		  
		  amortizer_direct_damper_force_factor = 50000,
		  amortizer_back_damper_force_factor  = 60000,

		allowable_hard_contact_length			= 0.25,
		anti_skid_installed = true,
		wheel_roll_friction_factor     = 0.20,-- DO NOT activate, already implemented in EFM code
		wheel_damage_speed			   = 180,
		wheel_moment_of_inertia  	   = 0.6, --wheel moi as rotation body
		
		
		 wheel_radius      = 0.6,
		  wheel_static_friction_factor  = 0.75 ,
		  wheel_side_friction_factor    = 1.0,--0.85 ,
		  wheel_roll_friction_factor    = 0.1 ,
		  wheel_glide_friction_factor   = 0.65 ,
		  wheel_damage_force_factor     = 450.0,
		wheel_brake_moment_max 		= 80000.0, -- maximum value of braking moment  , N*m 
		
		arg_post			  = 5,
		arg_amortizer		  = 6,
		arg_wheel_rotation    = 102,
		arg_wheel_rotation    = 77,
		arg_wheel_yaw		  = -1,
		collision_shell_name  = "WHEEL_L",
		arg_wheel_damage   = 136
	},
		{-- Right wheel
				mass = 200,
				 -- pos   			  = {-0.656,	-2.378,	-2.218},
		 		pos   			  = {-1.51, -1.09, 1.3 },
				
				damage_element	    = 5,

				wheel_axle_offset 	= 0.38,
				self_attitude	    = false,
				yaw_limit		    = math.rad(0.0),
				damper_coeff	    = 160.0,

		  amortizer_max_length     = 0.4  , 
		  amortizer_basic_length   = 0.4  ,
		  amortizer_reduce_length  = 0.4  ,
		  
				  amortizer_spring_force_factor   = 50000.0, -- 10000 -- force = spring_force_factor * pow(reduce_length, amortizer_spring_force_factor_rate
				  amortizer_spring_force_factor_rate  = 3,
				  amortizer_static_force     = 202394.0, 
				  amortizer_direct_damper_force_factor = 150000.0,
				  amortizer_back_damper_force_factor  = 125000.0,
				  
				  amortizer_direct_damper_force_factor = 50000,
				  amortizer_back_damper_force_factor  = 60000,

				allowable_hard_contact_length			= 0.25,
				anti_skid_installed = true,
				wheel_roll_friction_factor     = 0.20,-- DO NOT activate, already implemented in EFM code
				wheel_damage_speed			   = 180,
				wheel_moment_of_inertia  	   = 0.6, --wheel moi as rotation body
				
				
				  wheel_radius      = 0.6,
				  wheel_static_friction_factor  = 0.75 ,
				  wheel_side_friction_factor    = 1.0,--0.85 ,
				  wheel_roll_friction_factor    = 0.1 ,
				  wheel_glide_friction_factor   = 0.65 ,
				  wheel_damage_force_factor     = 450.0,
			  
			  
				wheel_brake_moment_max = 80000.0, -- maximum value of braking moment  , N*m 
				
				arg_post			  = 3,
				arg_amortizer		  = 4,
				arg_wheel_rotation    = 103,
				arg_wheel_rotation    = 77,
				arg_wheel_yaw		  = -1,
				collision_shell_name  = "WHEEL_R",
			},
	}, -- gears
		
	disable_built_in_oxygen_system	= true,
	--[[ ------------------------------------------------------------- ]]--
	-- END -- this part of the file is not intended for an end-user editing

	-- view shake amplitude
	minor_shake_ampl = 0.21,
	major_shake_ampl = 0.5,

	-- debug
	debugLine = "{M}:%1.3f {IAS}:%4.1f {AoA}:%2.1f {ny}:%2.1f {nx}:%1.2f {AoS}:%2.1f {mass}:%2.1f {Fy}:%2.1f {Fx}:%2.1f {wx}:%.1f {wy}:%.1f {wz}:%.1f {Vy}:%2.1f {dPsi}:%2.1f",
	record_enabled = false,
}