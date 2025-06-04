# BEFORE                                   # AFTER
app/views/                                 app/views/
├── users/                                 ├── users/
│   ├── dashboard.html.erb   ◀───────────▶ │   ├── dashboard.html.erb     # ✅ Post-login hub
│   └── show.html.erb        ◀───────────▶ │   └── show.html.erb          # ✅ Public user profile
                                          │
                                          ├── devise/
                                          │   ├── sessions/
                                          │   │   └── new.html.erb        # ✅ Custom login page (simple_form)
                                          │   ├── registrations/
                                          │   │   ├── new.html.erb        # ✅ Sign-up page
                                          │   │   └── edit.html.erb       # ✅ Account update page
                                          │   └── shared/
                                          │       └── _links.html.erb     # Optional Devise links partial



app/
├── controllers/
│   ├── application_controller.rb
│   ├── users_controller.rb
│   ├── pages_controller.rb
│   └── flats_controller.rb
│
├── models/
│   ├── user.rb
│   └── flat.rb
│
├── views/
│   ├── layouts/
│   │   ├── application.html.erb
│   │   ├── mailer.html.erb
│   │   └── mailer.text.erb
│   │
│   ├── pages/
│   │   └── home.html.erb
│   │
│   ├── users/
│   │   ├── dashboard.html.erb
│   │   └── show.html.erb
│   │
│   └── flats/
│       ├── index.html.erb
│       ├── show.html.erb
│       ├── new.html.erb
│       ├── edit.html.erb
│       └── _form.html.erb
