!
! namelist for dcmip2012 test 3-1 nonhydrostatic gravity waves
! Small planet X = 125
! NE=27 (1.125 degrees)
! Scale NE30 viscosity: 1e15 -> 5.121e8
! run length: 1h small planet time
! hydrostatic timestep: 300 -> 2.4
!
!_______________________________________________________________________
&ctl_nl
  nthreads          = 1
  partmethod        = 4                         ! mesh parition method: 4 = space filling curve
  topology          = "cube"                    ! mesh type: cubed sphere
  test_case         = "dcmip2012_test3"         ! test identifier
  ne                = 7                         ! number of elements per cube face
  qsize             = 0                         ! num tracer fields
  nmax              = 360                       ! total number of steps: 3600s / tstep
  statefreq         = 90                        ! number of steps between screen dumps
  restartfreq       = -1                        ! don't write restart files if < 0
  runtype           = 0                         ! 0 = new run
  tstep             = 10.0                      ! largest timestep
  rsplit            = 3
  integration       = 'explicit'                ! explicit time integration
  tstep_type        = 5                         ! 1 => default method
  nu                = 375e8                     ! reduced earth hyperviz
  nu_p              = 375e8
  hypervis_order    = 2                         ! 2 = hyperviscosity
  hypervis_subcycle = 1                         ! 1 = no hyperviz subcycling
  rearth            = 50969.76                  ! scaled earth radius = a/125.0
  omega             = 0.0                       ! earth angular speed = 0.0
/
&vert_nl
  vanalytic         = 1                         ! set vcoords in initialization routine
  vtop              = 2.73919e-1                ! vertical coordinate at top of atm (z=10000m)
/
&analysis_nl
  output_dir        = "./movies/"               ! destination dir for netcdf file
  output_timeunits  = 0,                        ! 1=days, 2=hours, 0=timesteps
  output_frequency  = 90,                       ! steps
  output_varnames1  ='T','ps','u','v','omega'   ! variables to write to file
  interp_type       = 0                         ! 0=native grid, 1=bilinear
  output_type       ='netcdf'                   ! netcdf or pnetcdf
  num_io_procs      = 16         
  interp_nlat       = 128
  interp_nlon       = 256
  interp_gridtype   = 2                         ! gauss grid
/
&prof_inparm
  profile_outpe_num   = 100
  profile_single_file	= .true.
/
