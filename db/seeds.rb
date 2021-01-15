




cameron = User.create(name: "Cameron", email: "Camnn3@yahoo.com", password: "password")
shalyse = User.create(name: "Shalyse", email: "Shalyse@yahoo.com", password: "password1")
vanessa = User.create(name: "Vanessa", email: "Vnewman@yahoo.com", password: "password2")



Complaint.create(content: "WOW is bugging a lot for me not letting me log in?", user_id: cameron.id)



cameron.complaints.create(content: "Overwatch is starting to bug for me as well??")
shalyse.complaints.create(content: "I am not able to open minecraft im getting an error?")



vanessas_complaint = vanessa.complaints.build(content: "The toxicity of The Hunt is so bad -_-")
vanessas_complaint.save

 