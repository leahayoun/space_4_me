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
  email: "n.dupont@mail.com",
  password: "123456",
  first_name: "Nathan",
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
    title: "Petit-déjeuner d'équipe",
    content: "Réunion informelle pour discuter des objectifs du trimestre. Café et viennoiseries offerts.",
    address: "Bureau principal, 10 Rue de la Collaboration, 75008 Paris",
    date: Date.today + 2.days,
    event_type: "Professionnel",
    user: user
  },
  {
    title: "Rendez-vous chez le dentiste",
    content: "Détartrage et contrôle annuel. Apporter la carte vitale et la mutuelle.",
    address: "Dr. Dubois, 7 Rue du Sourire, 75012 Paris",
    date: Date.today + 1.days,
    start_time: Time.now.change(hour: 14, min: 30),
    event_type: "Médical",
    user: user
  },
  {
    title: "Dîner en famille",
    content: "Dîner organisé chez les parents pour célébrer l'anniversaire de ma mère. Prévoir un cadeau.",
    address: "Chez les parents, 18 Rue des Fleurs, 92100 Boulogne-Billancourt",
    date: Date.today + 1.days,
    start_time: Time.now.change(hour: 19, min: 30),
    event_type: "Social",
    user: user
  },
  {
    title: "Séance de kinésithérapie",
    content: "Exercices de rééducation pour l'épaule. Prévoir une tenue confortable.",
    address: "Cabinet KinéForme, 3 Rue du Mouvement, 75010 Paris",
    date: Date.today + 5.days,
    event_type: "Médical",
    user: user
  },
  {
    title: "Déjeuner avec un client",
    content: "Rencontre avec M. Dupont pour finaliser le contrat. Réservation au restaurant Le Bistrot.",
    address: "Le Bistrot, 15 Rue de la Gourmandise, 75003 Paris",
    date: Date.today + 2.days,
    event_type: "Professionnel",
    user: user
  },
  {
    title: "Cours de méditation",
    content: "Séance guidée pour apprendre à gérer le stress. Durée : 1h. Apporter un coussin si possible.",
    address: "Espace Calme, 8 Rue de la Sérénité, 75009 Paris",
    date: Date.today + 4.days,
    event_type: "Bien-être",
    user: user
  },
  {
    title: "Rendez-vous chez le coiffeur",
    content: "Coupe et brushing. Prévoir 1h30. Confirmer l'heure par SMS.",
    address: "Salon Éclat, 22 Rue des Cheveux, 75004 Paris",
    date: Date.today + 2.days,
    event_type: "Personnel",
    user: user
  },

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
    date: Date.today + 1.days,
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
    date: Date.today - 2.days,
    start_time: Time.now.change(hour: 10, min: 30),
    event_type: "Médical",
    user: user
  },
  {
    title: "Cours de yoga",
    content: "Séance de yoga pour débutants. Prévoir un tapis et des vêtements confortables.",
    address: "Studio Zen, 12 Rue de la Tranquillité, 75011 Paris",
    date: Date.today + 2.days,
    start_time: Time.now.change(hour: 18, min: 30), # Exemple : 18h30
    event_type: "Bien-être",
    user: user
  },
  {
    title: "Atelier d'écriture créative",
    content: "Atelier mensuel pour explorer des techniques d'écriture. Apporter un carnet et un stylo.",
    address: "Bibliothèque municipale, 3 Rue des Livres, 75005 Paris",
    date: Date.today + 15.days,
    event_type: "Éducatif",
    user: user
  },

  {
    title: "Dîner en famille",
    content: "Dîner organisé chez les parents pour célébrer l'anniversaire de ma mère. Prévoir un cadeau.",
    address: "Chez les parents, 18 Rue des Fleurs, 92100 Boulogne-Billancourt",
    date: Date.today + 8.days,
    event_type: "Social",
    user: user
  },

  {
    title: "Réunion associative",
    content: "Réunion mensuelle de l'association de quartier. Ordre du jour : organisation de la fête de printemps.",
    address: "Mairie du 14e, 2 Place Ferdinand Brunot, 75014 Paris",
    date: Date.today,
    start_time: Time.now.change(hour: 15, min: 30),
    event_type: "Social",
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

user.diaries.delete_all

puts "📔 Création des journaux ..."

diaries = [
  { title: "Première consultation", days_ago: 30, content: "Aujourd'hui j'ai franchi le pas. Le médecin était à l'écoute, bienveillant. Pour la première fois, quelqu'un m'a demandé comment je voulais qu'on m'appelle. Ce simple geste m'a fait monter les larmes aux yeux. Je me suis senti·e vu·e, reconnu·e. C'est le début de quelque chose, je le sens." },
  { title: "Lettre à mon reflet", days_ago: 21, content: "Cher reflet, je sais qu'on ne s'est pas toujours bien entendu. Mais aujourd'hui, pour la première fois, j'ai vu quelqu'un que je commence à reconnaître. Quelqu'un qui me ressemble enfin. On a encore du chemin, toi et moi, mais je crois qu'on va y arriver." },
  { title: "Coming out à Maman", days_ago: 14, content: "Elle a pleuré. Puis elle m'a serré·e dans ses bras et m'a dit 'Je t'aime, peu importe qui tu es'. Je ne m'attendais pas à ça. Le soulagement est immense. J'avais préparé des arguments, des explications, mais finalement on a juste pleuré ensemble. De joie, je crois." },
  { title: "Les petites victoires", days_ago: 3, content: "Un inconnu m'a genré correctement aujourd'hui. Sans effort, naturellement. J'ai souri pendant une heure entière. Ces moments valent tout l'or du monde. C'est fou comme un simple mot peut illuminer une journée entière. Je collectionne ces petites victoires précieusement."
  }
]

diaries.each do |d|
  t = d[:days_ago].days.ago

  diary = user.diaries.create!(title: d[:title], content: d[:content])
  diary.update_columns(created_at: t, updated_at: t)
end

puts "😊 Création des humeurs de base..."

moods_data = [
  { name: "Heureux", icon: "😊" },
  { name: "Triste", icon: "😢" },
  { name: "Stressé·e", icon: "😰" },
  { name: "Énergique", icon: "💪" },
  { name: "Fatigué·e", icon: "😴" },
  { name: "Anxieux", icon: "😥" },
  { name: "Calme", icon: "😌" },
  { name: "Excité·e", icon: "🤩" },
  { name: "Optimiste", icon: "🌈" },
  { name: "Déprimé·e", icon: "☁️" }
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
  { user: user, date: Date.today },
  { user: user, date: Date.yesterday },
  { user: user, date: Date.today - 2.days },
  { user: user, date: Date.today - 3.days },
  { user: user, date: Date.today - 4.days },
  { user: user, date: Date.today - 5.days }
]

feelings = feelings_data.map do |data|
  feeling = Feeling.create!(data)
  feeling.update_columns(
    created_at: data[:date],
    updated_at: data[:date]
  )
  feeling
end


puts "✅ #{Feeling.count} états émotionnels créés"

puts "🔗 Association des humeurs aux états émotionnels..."

# Associer des humeurs aux feelings
if feelings.any? && Mood.any?
  UserMood.create!([
    { feeling: feelings[0], mood: Mood.find_by(name: "Calme") },
    { feeling: feelings[0], mood: Mood.find_by(name: "Fatigué·e") },
    { feeling: feelings[1], mood: Mood.find_by(name: "Stressé·e") },
    { feeling: feelings[2], mood: Mood.find_by(name: "Heureux") },
    { feeling: feelings[2], mood: Mood.find_by(name: "Optimiste") },
    { feeling: feelings[3], mood: Mood.find_by(name: "Optimiste") }
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
    title: "RDV orthophoniste",
    description: "Première séance pour le travail sur la voix",
    tag: "medical",
    user: user
  },
  {
    title: "Pharmacie",
    description: "Acheter Œstrodose et Androcur pour le mois prochain",
    tag: "medical",
    user: user
  },
  {
    title: "Informer la banque",
    description: "Prendre RDV pour mettre à jour les infos et commander une nouvelle carte",
    tag: "administratif",
    user: user
  },
  {
    title: "Changement prénom",
    description: "Envoyer le dossier de changement d'état civil",
    tag: "administratif",
    user: user
  },
  {
    title: "RDV coiffeur",
    description: "Essayer une nouvelle coupe",
    tag: "autres",
    user: user
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
puts "  📧 Email : n.dupont@mail.com"
puts "  🔑 Mot de passe : 123456"
puts ""
puts "=" * 50
puts "Pour réinitialiser : rails db:drop db:create db:migrate db:seed"
puts "Pour ajouter plus de données : relancer rails db:seed"
