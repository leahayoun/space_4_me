# db/seeds.rb
# Ce fichier remplit la base de données avec des données de test
# Pour l'exécuter : rails db:seed

puts "🗑️  Nettoyage de la base de données..."

# Destruction dans l'ordre pour éviter les erreurs de clé étrangère
UserMood.destroy_all
UserSymptom.destroy_all
Feeling.destroy_all
Mood.destroy_all
Symptom.destroy_all
Appointment.destroy_all
HormonalTreatment.destroy_all
Operation.destroy_all
Diary.destroy_all
Task.destroy_all
User.destroy_all

puts "👤 Création de l'utilisateur de test..."

# Création d'un utilisateur avec Devise
user = User.create!(
  email: "test@example.com",
  password: "password123",
  first_name: "Jean",
  last_name: "Dupont",
  birth_sex: "Homme",
  gender: "Homme",
  date_of_birth: Date.new(1990, 5, 15),
  onboarding: true
)

puts "✅ Utilisateur créé : #{user.first_name} #{user.last_name}"

puts "📅 Création des rendez-vous..."

appointments_data = [
  {
    title: "Consultation endocrinologue",
    content: "Contrôle des taux hormonaux et ajustement du traitement si nécessaire. Penser à apporter les résultats de la dernière prise de sang.",
    address: "Dr. Martin, 15 Rue de Médecine, 75006 Paris",
    date: Date.today + 10.days,
    event_type: "Médical",
    user: user
  },
  {
    title: "Thérapie hebdomadaire",
    content: "Session avec la psychologue. Points à aborder : gestion du stress au travail et relations familiales.",
    address: "45 Avenue des Ternes, 75017 Paris",
    date: Date.today + 3.days,
    event_type: "Thérapie",
    user: user
  },
  {
    title: "Café avec les amis",
    content: "Retrouvailles avec le groupe de soutien au café du coin. Partage d'expériences dans un cadre informel.",
    address: "Café des Amis, 22 Rue du Commerce, 75015 Paris",
    date: Date.today + 7.days,
    event_type: "Social",
    user: user
  },
  {
    title: "Suivi post-opératoire",
    content: "Contrôle de la cicatrisation et évaluation des résultats. Questions à poser : massages, soins, activité physique autorisée.",
    address: "Clinique Esthétique, 8 Rue de la Paix, 75002 Paris",
    date: Date.today - 5.days,
    event_type: "Médical",
    user: user
  },
  {
    title: "Réunion de travail",
    content: "Présentation du projet TransTech aux investisseurs. Préparer le pitch et les données chiffrées.",
    address: "Siège social, 42 Rue de la République, 69002 Lyon",
    date: Date.today + 14.days,
    event_type: "Professionnel",
    user: user
  }
]

appointments_data.each do |appointment_data|
  Appointment.create!(appointment_data)
end

puts "✅ #{Appointment.count} rendez-vous créés"

puts "💊 Création des traitements hormonaux..."

hormonal_treatments_data = [
  {
    product_name: "Œstrodose",
    dosage: 75,
    user: user,
    # Note : dosage en µg/jour (microgrammes par jour)
    created_at: Date.today - 6.months
  },
  {
    product_name: "Androcur",
    dosage: 12,
    user: user,
    # Note : dosage en mg/jour (milligrammes par jour)
    created_at: Date.today - 6.months
  },
  {
    product_name: "Progestérone",
    dosage: 100,
    user: user,
    # Note : prise cyclique, 15 jours par mois
    created_at: Date.today - 3.months
  }
]

hormonal_treatments_data.each do |treatment_data|
  HormonalTreatment.create!(treatment_data)
end

puts "✅ #{HormonalTreatment.count} traitements hormonaux créés"

puts "🏥 Création des opérations chirurgicales..."

operations_data = [
  {
    date: Date.new(2023, 6, 15),
    body_part: "Visage",
    operation_type: "Féminisation faciale (FFS)",
    organization_name: "Clinique du Parc, Lyon",
    user: user,
    # Note : FFS = Facial Feminization Surgery
  },
  {
    date: Date.new(2024, 1, 20),
    body_part: "Poitrine",
    operation_type: "Mammoplastie d'augmentation",
    organization_name: "Hôpital Saint-Louis, Paris",
    user: user,
    # Note : Implants de 350cc, récupération de 4 semaines
  }
]

operations_data.each do |operation_data|
  Operation.create!(operation_data)
end

puts "✅ #{Operation.count} opérations créées"

puts "📔 Création des journaux intimes..."

diaries_data = [
  {
    title: "Début du parcours",
    user: user,
    created_at: Date.today - 8.months
  },
  {
    title: "6 mois de transition",
    user: user,
    created_at: Date.today - 2.months
  },
  {
    title: "Réflexions post-opératoires",
    user: user,
    created_at: Date.today - 1.month
  }
]

diaries_data.each do |diary_data|
  Diary.create!(diary_data)
end

puts "✅ #{Diary.count} journaux créés"

puts "😊 Création des humeurs de base..."

moods_data = [
  { name: "Heureux", icon: "😊" },
  { name: "Triste", icon: "😢" },
  { name: "Stressé", icon: "😰" },
  { name: "Énergique", icon: "💪" },
  { name: "Fatigué", icon: "😴" },
  { name: "Anxieux", icon: "😥" },
  { name: "Calme", icon: "😌" },
  { name: "Excité", icon: "🤩" },
  { name: "Optimiste", icon: "🌈" },
  { name: "Déprimé", icon: "☁️" }
]

moods_data.each do |mood_data|
  Mood.create!(mood_data)
end

puts "✅ #{Mood.count} humeurs créées"

puts "🤒 Création des symptômes de base..."

symptoms_data = [
  { name: "Maux de tête" },
  { name: "Nausées" },
  { name: "Fatigue intense" },
  { name: "Bouffées de chaleur" },
  { name: "Sautes d'humeur" },
  { name: "Tension mammaire" },
  { name: "Prise de poids" },
  { name: "Sécheresse cutanée" },
  { name: "Insomnie" },
  { name: "Perte de libido" }
]

symptoms_data.each do |symptom_data|
  Symptom.create!(symptom_data)
end

puts "✅ #{Symptom.count} symptômes créés"

puts "💭 Création des états émotionnels..."

# Créer quelques feelings pour l'utilisateur
feelings_data = [
  { user: user, created_at: Date.today },
  { user: user, created_at: Date.yesterday },
  { user: user, created_at: Date.today - 2.days }
]

feelings = []
feelings_data.each do |feeling_data|
  feelings << Feeling.create!(feeling_data)
end

puts "✅ #{Feeling.count} états émotionnels créés"

puts "🔗 Association des humeurs aux états émotionnels..."

# Associer des humeurs aux feelings
if feelings.any? && Mood.any?
  UserMood.create!([
    { feeling: feelings[0], mood: Mood.find_by(name: "Calme") },
    { feeling: feelings[0], mood: Mood.find_by(name: "Fatigué") },
    { feeling: feelings[1], mood: Mood.find_by(name: "Stressé") },
    { feeling: feelings[2], mood: Mood.find_by(name: "Heureux") },
    { feeling: feelings[2], mood: Mood.find_by(name: "Optimiste") }
  ])
end

puts "🔗 Association des symptômes aux états émotionnels..."

# Associer des symptômes aux feelings
if feelings.any? && Symptom.any?
  UserSymptom.create!([
    { feeling: feelings[0], symptom: Symptom.find_by(name: "Fatigue intense") },
    { feeling: feelings[1], symptom: Symptom.find_by(name: "Maux de tête") },
    { feeling: feelings[1], symptom: Symptom.find_by(name: "Insomnie") },
    { feeling: feelings[2], symptom: Symptom.find_by(name: "Bouffées de chaleur") }
  ])
end

puts "📝 Création des tâches/checklists..."

tasks_data = [
  {
    title: "Pharmacie",
    description: "Acheter Œstrodose et Androcur pour le mois prochain",
    tag: "Santé",
    user: user,
    created_at: Date.today
  },
  {
    title: "Prise de sang",
    description: "Contrôle hormonal trimestriel - être à jeun",
    tag: "Médical",
    user: user,
    created_at: Date.today - 2.days
  },
  {
    title: "Yoga",
    description: "Séance de 30 minutes pour la souplesse et la détente",
    tag: "Bien-être",
    user: user,
    created_at: Date.today - 1.day
  },
  {
    title: "Administratif",
    description: "Envoyer le dossier de changement d'état civil",
    tag: "Administratif",
    user: user,
    created_at: Date.today - 3.days
  },
  {
    title: "RDV coiffeur",
    description: "Essayer une nouvelle coupe plus féminine",
    tag: "Apparence",
    user: user,
    created_at: Date.today
  }
]

tasks_data.each do |task_data|
  Task.create!(task_data)
end

puts "✅ #{Task.count} tâches créées"

puts ""
puts "=" * 50
puts "🎉 BASE DE DONNÉES PEUPLÉE AVEC SUCCÈS !"
puts "=" * 50
puts ""
puts "📊 RÉCAPITULATIF DES DONNÉES CRÉÉES :"
puts "  👤 Utilisateurs : #{User.count}"
puts "  📅 Rendez-vous : #{Appointment.count}"
puts "  💊 Traitements hormonaux : #{HormonalTreatment.count}"
puts "  🏥 Opérations : #{Operation.count}"
puts "  📔 Journaux : #{Diary.count}"
puts "  😊 Humeurs : #{Mood.count}"
puts "  🤒 Symptômes : #{Symptom.count}"
puts "  💭 États émotionnels : #{Feeling.count}"
puts "  📝 Tâches : #{Task.count}"
puts ""
puts "🔐 INFORMATIONS DE CONNEXION :"
puts "  📧 Email : test@example.com"
puts "  🔑 Mot de passe : password123"
puts ""
puts "=" * 50
puts "Pour réinitialiser : rails db:drop db:create db:migrate db:seed"
puts "Pour ajouter plus de données : relancer rails db:seed"
