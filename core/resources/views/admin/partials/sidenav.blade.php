<div class="sidebar {{ sidebarVariation()['selector'] }} {{ sidebarVariation()['sidebar'] }} {{ @sidebarVariation()['overlay'] }} {{ @sidebarVariation()['opacity'] }}"
     data-background="{{getImage('assets/admin/images/sidebar/2.jpg','400x800')}}">
    <button class="res-sidebar-close-btn"><i class="las la-times"></i></button>
    <div class="sidebar__inner">
        <div class="sidebar__logo">
            <a href="{{route('admin.dashboard')}}" class="sidebar__main-logo"><img
                    src="{{getImage(imagePath()['logoIcon']['path'] .'/logo_2.png')}}" alt="@lang('image')"></a>
            <a href="{{route('admin.dashboard')}}" class="sidebar__logo-shape"><img
                    src="{{getImage(imagePath()['logoIcon']['path'] .'/favicon.png')}}" alt="@lang('image')"></a>
            <button type="button" class="navbar__expand"></button>
        </div> 

        <div class="sidebar__menu-wrapper" id="sidebar__menuWrapper">
            <ul class="sidebar__menu">
                <li class="sidebar-menu-item {{menuActive('admin.dashboard')}}">
                    <a href="{{route('admin.dashboard')}}" class="nav-link ">
                        <i class="menu-icon las la-home"></i>
                        <span class="menu-title">@lang('Dashboard')</span>
                    </a>
                </li>

                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="{{menuActive('admin.users*',3)}}">
                        <i class="menu-icon las la-users"></i>
                        <span class="menu-title">@lang('Manage Users')</span>

                        @if($banned_users_count > 0 || $email_unverified_users_count > 0 || $sms_unverified_users_count > 0)
                            <span class="menu-badge pill bg--primary ml-auto">
                                <i class="fa fa-exclamation"></i>
                            </span>
                        @endif
                    </a>
                    <div class="sidebar-submenu {{menuActive('admin.users*',2)}} ">
                        <ul>
                            <li class="sidebar-menu-item {{menuActive('admin.users.all')}} ">
                                <a href="{{route('admin.users.all')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('All Users')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{menuActive('admin.users.active')}} ">
                                <a href="{{route('admin.users.active')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Active Users')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item {{menuActive('admin.users.banned')}} ">
                                <a href="{{route('admin.users.banned')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Banned Users')</span>
                                    @if($banned_users_count)
                                        <span class="menu-badge pill bg--primary ml-auto">{{$banned_users_count}}</span>
                                    @endif
                                </a>
                            </li>

                            

                           


                            

                        </ul>
                    </div>
                </li>

                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="{{menuActive('admin.deposit*',3)}}">
                        <i class="menu-icon las la-credit-card"></i>
                        <span class="menu-title">@lang('Payment History')</span>
                        @if(0 < $pending_payment_count)
                            <span class="menu-badge pill bg--primary ml-auto">
                                <i class="fa fa-exclamation"></i>
                            </span>
                        @endif
                    </a>
                    <div class="sidebar-submenu {{menuActive('admin.deposit*',2)}} ">
                        <ul>
                            <li class="sidebar-menu-item {{menuActive('admin.deposit.pending')}} ">
                                <a href="{{ route('admin.deposit.pending') }}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Pending Payment')</span>
                                    @if($pending_payment_count)
                                        <span class="menu-badge pill bg--primary ml-auto">{{$pending_payment_count}}</span>
                                    @endif
                                </a>
                            </li>
                            <li class="sidebar-menu-item {{menuActive('admin.deposit.successful')}} ">
                                <a href="{{ route('admin.deposit.successful') }}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Successful Payment')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item {{menuActive('admin.deposit.rejected')}} ">
                                <a href="{{ route('admin.deposit.rejected') }}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Rejected Payment')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item {{menuActive('admin.deposit.all')}} ">
                                <a href="{{ route('admin.deposit.all') }}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('All Payment')</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="{{menuActive('admin.vehicle.ticket*',3)}}">
                        <i class="menu-icon las la-credit-card"></i>
                        <span class="menu-title">@lang('Booking History')</span>
                        @if(0 < $pending_vehicle_ticket)
                            <span class="menu-badge pill bg--primary ml-auto">
                                <i class="fa fa-exclamation"></i>
                            </span>
                        @endif
                    </a>
                    <div class="sidebar-submenu {{menuActive('admin.vehicle.ticket*',2)}} ">
                        <ul>
                            <li class="sidebar-menu-item {{menuActive('admin.vehicle.ticket.pending')}} ">
                                <a href="{{ route('admin.vehicle.ticket.pending') }}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Pending Ticket')</span>
                                    @if($pending_vehicle_ticket)
                                        <span class="menu-badge pill bg--primary ml-auto">{{$pending_vehicle_ticket}}</span>
                                    @endif
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{menuActive('admin.vehicle.ticket.booked')}} ">
                                <a href="{{ route('admin.vehicle.ticket.booked') }}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Booked Ticket')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{menuActive('admin.vehicle.ticket.rejected')}}">
                                <a href="{{ route('admin.vehicle.ticket.rejected') }}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Rejected Ticket')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{menuActive('admin.vehicle.ticket.list')}} ">
                                <a href="{{ route('admin.vehicle.ticket.list') }}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('All Ticket')</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="{{menuActive('admin.gateway*',3)}}">
                        <i class="menu-icon las la-credit-card"></i>
                        <span class="menu-title">@lang('Payment Gateways')</span>

                    </a>
                    <div class="sidebar-submenu {{menuActive('admin.gateway*',2)}} ">
                        <ul>

                           
                            <li class="sidebar-menu-item {{menuActive('admin.gateway.manual.index')}} ">
                                <a href="{{route('admin.gateway.manual.index')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Manual Gateways')</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="{{menuActive('admin.ticket*',3)}}">
                        <i class="menu-icon la la-ticket"></i>
                        <span class="menu-title">@lang('Support Ticket') </span>
                        @if(0 < $pending_ticket_count)
                            <span class="menu-badge pill bg--primary ml-auto">
                                <i class="fa fa-exclamation"></i>
                            </span>
                        @endif
                    </a>
                    <div class="sidebar-submenu {{menuActive('admin.ticket*',2)}} ">
                        <ul>

                            <li class="sidebar-menu-item {{menuActive('admin.ticket')}} ">
                                <a href="{{route('admin.ticket')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('All Ticket')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item {{menuActive('admin.ticket.pending')}} ">
                                <a href="{{route('admin.ticket.pending')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Pending Ticket')</span>
                                    @if($pending_ticket_count)
                                        <span
                                            class="menu-badge pill bg--primary ml-auto">{{$pending_ticket_count}}</span>
                                    @endif
                                </a>
                            </li>
                            <li class="sidebar-menu-item {{menuActive('admin.ticket.closed')}} ">
                                <a href="{{route('admin.ticket.closed')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Closed Ticket')</span>
                                </a>
                            </li>
                            <li class="sidebar-menu-item {{menuActive('admin.ticket.answered')}} ">
                                <a href="{{route('admin.ticket.answered')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Answered Ticket')</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>


                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="{{menuActive('admin.report*',3)}}">
                        <i class="menu-icon la la-list"></i>
                        <span class="menu-title">@lang('Report') </span>
                    </a>
                    <div class="sidebar-submenu {{menuActive('admin.report*',2)}} ">
                        <ul>
                            <li class="sidebar-menu-item {{menuActive(['admin.report.login.history','admin.report.login.ipHistory'])}}">
                                <a href="{{route('admin.report.login.history')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Login History')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{menuActive('admin.report.email.history')}}">
                                <a href="{{route('admin.report.email.history')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Email History')</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                </li>

                <li class="sidebar__menu-header">@lang('Transport Manager')</li>

                <li class="sidebar-menu-item  {{menuActive('admin.manage.counter')}}">
                    <a href="{{route('admin.manage.counter')}}" class="nav-link"
                       data-default-url="{{ route('admin.manage.counter') }}">
                        <i class="menu-icon las la-warehouse"></i>
                        <span class="menu-title">@lang('Counter') </span>
                    </a>
                </li>

                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="{{menuActive('admin.fleet*',3)}}">
                        <i class="menu-icon las la-bus"></i>
                        <span class="menu-title">@lang('Manage Fleets')</span>
                    </a>
                    <div class="sidebar-submenu {{menuActive('admin.fleet*',2)}} ">
                        <ul>
                            <li class="sidebar-menu-item {{menuActive('admin.fleet.seat.layouts')}} ">
                                <a href="{{route('admin.fleet.seat.layouts')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Seat Layouts')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{menuActive('admin.fleet.type')}} ">
                                <a href="{{route('admin.fleet.type')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Fleet Type')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item  {{menuActive(['admin.fleet.vehicles', 'admin.fleet.vehicles.search'])}}">
                                <a href="{{route('admin.fleet.vehicles')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Vehicles')</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                </li>

                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="{{menuActive('admin.trip*',3)}}">
                        <i class="menu-icon las la-bus"></i>
                        <span class="menu-title">@lang('Manage Trips')</span>
                    </a>
                    <div class="sidebar-submenu {{menuActive('admin.trip*',2)}}">
                        <ul>
                            <li class="sidebar-menu-item {{menuActive(['admin.trip.route', 'admin.trip.route.create', 'admin.trip.route.edit'])}} ">
                                <a href="{{route('admin.trip.route')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Route')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{menuActive('admin.trip.schedule')}} ">
                                <a href="{{route('admin.trip.schedule')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Schedule')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item {{menuActive(['admin.trip.ticket.price', 'admin.trip.ticket.price.create', 'admin.trip.ticket.price.edit'])}} ">
                                <a href="{{route('admin.trip.ticket.price')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Ticket Price')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item  {{menuActive('admin.trip.list')}}">
                                <a href="{{route('admin.trip.list')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Trip')</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item  {{menuActive('admin.trip.vehicle.assign')}}">
                                <a href="{{route('admin.trip.vehicle.assign')}}" class="nav-link">
                                    <i class="menu-icon las la-dot-circle"></i>
                                    <span class="menu-title">@lang('Assigned Vehicle')</span>
                                </a>
                            </li>

                        </ul>
                    </div>
                </li>

                <!-- <li class="sidebar__menu-header">@lang('Settings')</li>

                <li class="sidebar-menu-item {{menuActive('admin.setting.index')}}">
                    <a href="{{route('admin.setting.index')}}" class="nav-link">
                        <i class="menu-icon las la-life-ring"></i>
                        <span class="menu-title">@lang('General Setting')</span>
                    </a>
                </li>

                <li class="sidebar-menu-item {{menuActive('admin.setting.logo.icon')}}">
                    <a href="{{route('admin.setting.logo.icon')}}" class="nav-link">
                        <i class="menu-icon las la-images"></i>
                        <span class="menu-title">@lang('Logo & Favicon')</span>
                    </a>
                </li> -->

                

               

                

                

           

                

                
                
            </ul>
            
        </div>
    </div>
</div>
<!-- sidebar end -->
