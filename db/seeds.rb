# Seeding the admin accounts ->

adminUserOne = User.create({email: 'adminOne@example.com', name: 'Admin One', password: 'password', userRole: 'ADMIN'});

adminUserTwo = User.create({email: 'adminTwo@example.com', name: 'Admin Two', password: 'password', userRole: 'ADMIN'});