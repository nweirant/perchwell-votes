Vote.destroy_all
Client.destroy_all

Client.create!(name: "Jimi Hendrix")
Client.create!(name: "Eddie Van Halen")
Client.create!(name: "Randy Rhoads")
Client.create!(name: "Alexi Laiho")
Client.create!(name: "Brian Haner Jr.")
Client.create!(name: "Darrell Abbott")
Client.create!(name: "James Hetfield")
Client.create!(name: "John Petrucci")
Client.create!(name: "Jerry Cantrell")
Client.create!(name: "John Frusciante")

p "Seeded clients successfully!"
