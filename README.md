APP
│
├── LICENSE
├── stylesheets/
│   ├── application.scss
│   ├── flash.scss
│   ├── config/
│   ├── pages/
│   └── components/
│       ├── _address_autocomplete.scss
│       ├── _alert.scss
│       ├── _auth.scss
│       ├── _avatar.scss
│       ├── _buttons.scss
│       ├── _flats.scss
│       ├── _footer.scss
│       ├── _form_legend_clear.scss
│       ├── _form.scss
│       ├── _index.scss
│       ├── _login_signup_box.scss
│       ├── _map.scss
│       ├── _navbar.scss
│       ├── _searchbar.scss
│
├── controllers/
│   ├── concerns/
│   ├── application_controller.rb
│   ├── bookings_controller.rb
│   ├── flats_controller.rb
│   ├── pages_controller.rb
│   └── users_controller.rb
│
├── javascript/
│   ├── application.js
│   └── controllers/
│       ├── address_autocomplete_controller.js
│       ├── application.js
│       ├── datepicker_controller.js
│       ├── hello_controller.js
│       ├── index.js
│       └── map_controller.js
│
├── models/
│   ├── concerns/
│   │   └── application_record.rb
│   ├── booking.rb
│   ├── flat.rb
│   └── user.rb
│
├── views/
│   ├── bookings/
│   │   ├── edit.html.erb
│   │   ├── index.html.erb
│   │   ├── new.html.erb
│   │   ├── request.html.erb
│   │   └── update.html.erb
│   ├── devise/
│   │   ├── registrations/
│   │   │   ├── edit.html.erb
│   │   │   └── new.html.erb
│   │   ├── sessions/
│   │   │   └── new.html.erb
│   │   └── shared/
│   │       └── _links.html.erb
│   ├── flats/
│   │   ├── _info_window.html.erb
│   │   ├── _marker.html.erb
│   │   ├── index.html.erb
│   │   ├── new.html.erb
│   │   └── show.html.erb
│   ├── layouts/
│   │   ├── application.html.erb
│   │   ├── mailer.html.erb
│   │   └── mailer.text.erb
│   ├── pages/
│   │   └── home.html.erb
│   ├── shared/
│   │   ├── _flash.html.erb
│   │   ├── _footer.html.erb
│   │   └── _navbar.html.erb
│   └── users/
│       ├── dashboard.html.erb
│       ├── edit.html.erb
│       └── show.html.erb
