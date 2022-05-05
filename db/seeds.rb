=begin

>d = Doctor.create
>p = Patient.create
>a = Appointment.create(doctor: d, patient: p)
#=> je crée une instance de chaque objet

>a.doctor
#=> on devrait obtenir en retour le docteur "d" créé plus haut. Sinon c'est qu'on a fait une erreur

>a.patient
#=> on devrait obtenir en retour le patient "p" créé plus haut. Sinon c'est qu'on a fait une erreur

>d.patients
#=> on devrait obtenir en retour un array contenant le patient "p" créé plus haut. Sinon c'est qu'on a fait une erreur

>p.doctors
#=> on devrait obtenir en retour un array contenant le doctor "d" créé plus haut. Sinon c'est qu'on a fait une erreur

=end


require 'faker'



Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all

#creation de 100 docteurs, 100 patients et 100 RDV avec attributs random:
100.times do |i| 
  apt = Appointment.new(date: Faker::Date.in_date_period)
  doc = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: Faker::Job.position, zip_code: Faker::Address.zip_code)
  pat = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  apt.doctor = doc
  apt.patient = pat
  apt.save
end

# IMPORTANT: TOUJOURS créer d'abord un 'new' Appointment, puis un docteur et un patient que l'on peut y associer/lier sinon on ne peut pas save l'id de l'appointment !!!
