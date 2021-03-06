
!-----------------------------------------------------------------------
! Physical constants
!-----------------------------------------------------------------------
module CONSTANTS
real, parameter :: &
  cp = 1005,         &! Specific heat capacity of air (J/K/kg)
  eps = 0.622,       &! Ratio of molecular weights of water and dry air
  e0 = 611.213,      &! Saturation vapour pressure at Tm (Pa)
  grav = 9.81,       &! Acceleration due to gravity (m/s^2)
  hcap_ice = 2100,   &! Specific heat capacity of ice (J/K/kg)
  hcap_wat = 4180,   &! Specific heat capacity of water (J/K/kg)
  hcon_air = 0.025,  &! Thermal conductivity of air (W/m/K)
  hcon_clay = 1.16,  &! Thermal conductivity of clay (W/m/K)
  hcon_ice = 2.24,   &! Thermal conducivity of ice (W/m/K)
  hcon_sand = 1.57,  &! Thermal conductivity of sand (W/m/K)
  hcon_wat = 0.56,   &! Thermal conductivity of water (W/m/K)
  I0 = 1367,         &! Solar constant (W/m^2)
  Lf = 0.334e6,      &! Latent heat of fusion (J/kg)
  Lv = 2.501e6,      &! Latent heat of vapourisation (J/kg)
  Ls = Lf + Lv,      &! Latent heat of sublimation (J/kg)
  pi = 3.14159,      &! pi
  Rair = 287,        &! Gas constant for air (J/K/kg)
  Rwat = 462,        &! Gas constant for water vapour (J/K/kg)
  rho_ice = 917,     &! Density of ice (kg/m^3)
  rho_wat = 1000,    &! Density of water (kg/m^3)
  sb = 5.67e-8,      &! Stefan-Boltzmann constant (W/m^2/K^4)
  Tm = 273.15,       &! Melting point (K)
  vkman = 0.4         ! Von Karman constant
end module CONSTANTS

!-----------------------------------------------------------------------
! Output diagnostics
!-----------------------------------------------------------------------
module DIAGNOSTICS
integer :: &
  Nave,              &! Number of timesteps in average outputs
  Nsmp                ! Timestep for sample outputs
integer, parameter :: &
  Ndiags = 10         ! Number of averaged diagnostics
real, allocatable :: &
  diags(:,:,:),      &! Averaged diagnostics
  SWin(:,:),         &! Cumulated incoming solar radiation (J/m^2)
  SWout(:,:)          ! Cumulated reflected solar radiation (J/m^2)
end module DIAGNOSTICS

!-----------------------------------------------------------------------
! Meteorological driving variables
!-----------------------------------------------------------------------
module DRIVING
integer :: &
  year,              &! Year
  month,             &! Month of year
  day                 ! Day of month
real :: &
  hour                ! Hour of day
real :: &
  dt,                &! Timestep (s)
  lat,               &! Latitude (radians)
  noon,              &! Time of solar noon (hour)
  Pscl,              &! Precipitation adjustment scale (1/km)
  Tlps,              &! Temperature lapse rate (K/km)
  Tsnw,              &! Snow threshold temperature (K)
  zaws,              &! Weather station elevation for downscaling (m)
  zT,                &! Temperature measurement height (m)
  zU                  ! Wind speed measurement height (m)
real :: &
  Sdif,              &! Diffuse shortwave radiation (W/m^2)
  Sdir,              &! Direct-beam shortwave radiation (W/m^2)
  Udir                ! Wind direction (degrees, clockwise from N)
real, allocatable :: &
  LW(:,:),           &! Incoming longwave radiation (W/m^2)
  Ps(:,:),           &! Surface pressure (Pa)
  Qa(:,:),           &! Specific humidity (kg/kg)
  Rf(:,:),           &! Rainfall rate (kg/m^2/s)
  Sf(:,:),           &! Snowfall rate (kg/m^2/s)
  SW(:,:),           &! Incoming shortwave radiation (W/m^2)
  Ta(:,:),           &! Air temperature (K)
  Ua(:,:)             ! Wind speed (m/s)
end module DRIVING

!-----------------------------------------------------------------------
! Grid parameters
!-----------------------------------------------------------------------
module GRID
integer :: &
  Nsmax,             &! Maximum number of snow layers
  Nsoil,             &! Number of soil layers
  Nx,Ny               ! Grid dimensions
real, allocatable :: &
  Dzsnow(:),         &! Minimum snow layer thicknesses (m)
  Dzsoil(:)           ! Soil layer thicknesses (m)
end module GRID

!-----------------------------------------------------------------------
! Input / output unit numbers
!-----------------------------------------------------------------------
module IOUNITS
integer, parameter :: &
  umap = 11,         &! Map input file unit number
  umet = 21,         &! Driving input file unit number
  ustr = 31,         &! Start file unit number
  uave = 41,         &! Average output file unit number
  udmp = 51,         &! Dump output file unit number
  umta = 61,         &! Metadata output file unit number
  uprf = 71,         &! Profile output file number
  usmp = 81           ! Sample output file unit number
end module IOUNITS

!-----------------------------------------------------------------------
! Parameters
!-----------------------------------------------------------------------
module PARAMETERS
! Numerical solution parameter
integer :: &
  Nitr                ! Number of iterations in energy balance calulation
! Vegetation parameters
real :: &
  avg0,              &! Snow-free vegetation albedo
  avgs,              &! Snow-covered vegetation albedo
  cden,              &! Dense canopy turbulent transfer coefficient
  cvai,              &! Canopy snow capacity per unit VAI (kg/m^2)
  Gcn1,              &! Leaf angle distribution parameter
  Gcn2,              &! Leaf angle distribution parameter
  gsnf,              &! Snow-free vegetation moisture conductance (m/s)
  kdif,              &! Diffuse radiation extinction coefficient
  kveg,              &! Canopy cover coefficient
  cveg,              &! Vegetation turbulent transfer coefficient
  rchd,              &! Ratio of displacement height to canopy height
  rchz,              &! Ratio of roughness length to canopy height
  tcnc,              &! Canopy unloading time scale for cold snow (s)
  tcnm                ! Canopy unloading time scale for melting snow (s)
! Snow parameters
real :: &
  asmx,              &! Maximum albedo for fresh snow
  asmn,              &! Minimum albedo for melting snow
  bstb,              &! Atmospheric stability parameter
  bthr,              &! Snow thermal conductivity exponent
  eta0,              &! Reference snow viscosity (Pa s)
  hfsn,              &! Snowcover fraction depth scale (m)
  kfix,              &! Fixed thermal conductivity of snow (W/m/K)
  rgr0,              &! Fresh snow grain radius (m)
  rho0,              &! Fixed snow density (kg/m^3)
  rhob,              &! Temperature factor in fresh snow density (kg/m^3/K)
  rhoc,              &! Wind factor in fresh snow density (kg s^0.5/m^3.5)
  rhof,              &! Fresh snow density (kg/m^3)
  rcld,              &! Maximum density for cold snow (kg/m^3)
  rmlt,              &! Maximum density for melting snow (kg/m^3)
  Salb,              &! Snowfall to refresh albedo (kg/m^2)
  snda,              &! Thermal metamorphism parameter (1/s)
  Talb,              &! Albedo decay temperature threshold (C)
  tcld,              &! Cold snow albedo decay time scale (s)
  tmlt,              &! Melting snow albedo decay time scale (s)
  trho,              &! Snow compaction time scale (s)
  Wirr,              &! Irreducible liquid water content of snow
  z0sn                ! Snow roughness length (m)
! Surface parameters
real :: &
  gsat                ! Surface conductance for saturated soil (m/s)
end module PARAMETERS

!-----------------------------------------------------------------------
! Spatial surface characteristics
!-----------------------------------------------------------------------
module PARAMMAPS
real, allocatable :: &
  alb0(:,:),         &! Snow-free ground albedo
  canh(:,:),         &! Canopy heat capacity (J/K/m^2)
  fcly(:,:),         &! Soil clay fraction
  fsnd(:,:),         &! Soil sand fraction
  fsky(:,:),         &! Sky view fraction
  fveg(:,:),         &! Canopy cover fraction
  hcan(:,:),         &! Canopy height (m)
  scap(:,:),         &! Canopy snow capacity (kg/m^2)
  trcn(:,:),         &! Canopy transmissivity
  VAI(:,:),          &! Vegetation area index
  ztop(:,:),         &! Land surface elevations (m)
  z0sf(:,:)           ! Snow-free roughness length (m)
end module PARAMMAPS

!-----------------------------------------------------------------------
! Soil properties
!-----------------------------------------------------------------------
module SOILPARAMS
real, allocatable :: &
  b(:,:),            &! Clapp-Hornberger exponent
  hcap_soil(:,:),    &! Volumetric heat capacity of dry soil (J/K/m^3)
  hcon_soil(:,:),    &! Thermal conductivity of dry soil (W/m/K)
  sathh(:,:),        &! Saturated soil water pressure (m)
  Vcrit(:,:),        &! Volumetric soil moisture at critical point
  Vsat(:,:)           ! Volumetric soil moisture at saturation
end module SOILPARAMS

!-----------------------------------------------------------------------
! Model state variables  
!-----------------------------------------------------------------------
module STATE_VARIABLES
! Canopy state variables
real, allocatable :: &
  Qcan(:,:),         &! Canopy air space humidity
  Tcan(:,:),         &! Canopy air space temperature (K)
  Sveg(:,:),         &! Snow mass on vegetation (kg/m^2)
  Tveg(:,:)           ! Vegetation temperature (K)
! Surface state variables
real, allocatable :: &
  Tsrf(:,:)           ! Surface skin temperature (K)
! Snow state variables
integer, allocatable :: &
  Nsnow(:,:)          ! Number of snow layers
real, allocatable :: &
  albs(:,:),         &! Snow albedo
  Ds(:,:,:),         &! Snow layer thicknesses (m)
  rgrn(:,:,:),       &! Snow layer grain radius (m)
  Sice(:,:,:),       &! Ice content of snow layers (kg/m^2)
  Sliq(:,:,:),       &! Liquid content of snow layers (kg/m^2)
  Tsnow(:,:,:)        ! Snow layer temperatures (K)
! Soil state variables
real, allocatable :: &
  theta(:,:,:),      &! Volumetric moisture content of soil layers
  Tsoil(:,:,:)        ! Soil layer temperatures (K)
end module STATE_VARIABLES
