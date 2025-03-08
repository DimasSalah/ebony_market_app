class Category {
  String id;
  String description;
  String image;
  String name;
  List<SubCategory> subcategories;

  Category({
    required this.id,
    required this.description,
    required this.image,
    required this.name,
    required this.subcategories,
  });

  static List<Category> fetchAllCategories() {
    var restaurants = Category(
      id: 'restaurant',
      description: 'Offering diverse restaurants and menu\'s',
      image: 'assets/categories/restaurants1.jpg',
      name: 'Restaurants',
      subcategories: [
        SubCategory(
          id: 'african_restaurant',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Frestaurants%2FAfrican-Cuisine.jpg?alt=media&token=b4d155d7-6b11-41f5-8b39-5571ee3133ae',
          name: 'African Restaurants',
        ),
        SubCategory(
          id: 'caribbean_restaurant',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Frestaurants%2Fistockphoto-1264552142-612x612.jpg?alt=media&token=c31281f5-b7f6-4f06-bfba-99885348de5b',
          name: 'Caribbean Restaurants',
        ),
        SubCategory(
          id: 'seafood_restaurant',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Frestaurants%2Fphoto-1559742811-822873691df8.jpg?alt=media&token=321cca8c-adba-4127-a025-c444df4a17d6',
          name: 'Seafood Restaurants',
        ),
        SubCategory(
          id: 'cafes_restaurant',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Frestaurants%2Fpexels-photo-3116848.jpeg?alt=media&token=e8390faa-0568-4ac1-8b5a-3b3b1d3fe422',
          name: 'Dessert Cafés & Beverages',
        ),
        SubCategory(
          id: 'franchise_restaurant',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Frestaurants%2Fphoto-1551183053-bf91a1d81141.jpg?alt=media&token=7a8dc903-8159-44e5-9a70-7c5a744d138a',
          name: 'Franchises',
        ),
        SubCategory(
          id: 'catering_restaurant',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Frestaurants%2Fphoto-1565608087341-404b25492fee.jpg?alt=media&token=ed11fce3-b6b0-409c-aaa6-b4d627151128',
          name: 'Catering',
        ),
      ],
    );

    var retail = Category(
      id: 'retail',
      description:
          'Visit the best retail stores for all your day to day products and accesories',
      image: 'assets/categories/retail1.jpg',
      name: 'Retail',
      subcategories: [
        SubCategory(
          id: 'grocery_retail',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fretail%2Fphoto-1545601445-5b6f418af4bf.jpg?alt=media&token=56b0461d-1fd8-45f5-8bc2-c1e6cdf0bbf9',
          name: 'Grocery Stores',
        ),
        SubCategory(
          id: 'home_decor_retail',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fretail%2Fpexels-photo-1571453.jpeg?alt=media&token=45d18739-2b06-49df-b499-c47b1598ef62',
          name: 'Home & Decor',
        ),
        SubCategory(
          id: 'online_stores_retail',
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fretail%2Fpexels-photo-6994318.jpg?alt=media&token=9044f47d-ec5b-4aac-866e-aa8ec59ba609',
          name: 'Online Stores and Accessories',
        ),
      ],
    );

    var health = Category(
      id: 'health',
      description: 'Take care of your Physical and Mental health',
      image: 'assets/categories/health1.jpg',
      name: 'Health & Fitness',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fpexels-photo-4720790.jpg?alt=media&token=c56451e6-0553-465a-b542-37949fb4bbf7',
          name: 'Gyms & Fitness Classes',
          id: 'gyms_fitness_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fphoto-1576091160399-112ba8d25d1d.jpg?alt=media&token=1f7909d1-e830-43bd-80b2-59451938635f',
          name: 'Doctors & Health Clinics',
          id: 'doctors_clinics_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fpexels-photo-11369478.jpg?alt=media&token=d6423276-143c-4274-9f73-2426113c19d2',
          name: 'Midwife',
          id: 'midwife_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fpexels-photo-3845853.jpg?alt=media&token=30d16fdc-1587-4ef2-9e59-57729fad678c',
          name: 'Dentist',
          id: 'dentist_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fphoto-1512621776951-a57141f2eefd.jpg?alt=media&token=7daa6db7-e380-48f8-8485-61a17bcd93a7',
          name: 'Nutritionists & Herbalists',
          id: 'nutritionist_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fpexels-photo-5699475.jpg?alt=media&token=cb861c6b-619b-44b5-97d9-e4d8fbe11e8d',
          name: 'Therapists',
          id: 'therapist_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fpexels-photo-7446676.jpg?alt=media&token=1a736b9c-f1e7-4b2c-bf57-c862f5d33e4d',
          name: 'Dermatologists',
          id: 'dermatologist_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fpexels-photo-9268042.jpg?alt=media&token=b5a447d4-939b-4150-b1a8-1f5d142d63bf',
          name: 'Massage Therapists',
          id: 'massage_therapy_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fpexels-photo-8401091.jpeg?alt=media&token=085f1a42-c6bb-495b-a1cf-fdafac7cd64d',
          name: 'Coaches',
          id: 'coach_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fphoto-1561781019-31d9dd448a61.jpg?alt=media&token=8b9c0bed-ccea-464d-b68e-4eda87daf9d4',
          name: 'Sports Leagues',
          id: 'sports_leagues_health',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fherb.jpeg?alt=media&token=57a7ef7c-abc5-44b1-b1d0-6137ab4f1d2d',
          name: 'Herbalist',
          id: 'herbalist_health',
        ),
      ],
    );

    var arts = Category(
      id: 'art',
      description: 'Discovering talented Arts & Artist in our community',
      image: 'assets/categories/arts.jpg',
      name: 'Arts',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Farts%2Fphoto-1574095059431-815305ba05a0.jpg?alt=media&token=04cd645f-edbd-4cc9-86f8-2369ce647d1d',
          name: 'Painters & Drawings',
          id: 'painter_art',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Farts%2Fpexels-photo-102127.jpg?alt=media&token=b0bc5cb1-3487-4e6b-8158-04af34e1638a',
          name: 'Art Classes',
          id: 'class_art',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Farts%2Fpexels-photo-3622614.jpg?alt=media&token=fd286851-ec5a-476a-aede-16ffc20ee44a',
          name: 'Dancing Classes & Performing Arts',
          id: 'dacing_performing_art',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Farts%2Fpexels-photo-9008839.jpg?alt=media&token=80297bcc-e39d-4842-9242-dae036d4041a',
          name: 'Musicians',
          id: 'musician_art',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Farts%2Fphoto-1515634928627-2a4e0dae3ddf.jpg?alt=media&token=ba1bb6e0-4713-4834-be79-99e9052e270a',
          name: 'Film Makers & Screen Play Actors',
          id: 'actor_art',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Farts%2Fphoto-1523689119443-df96632084a1.jpg?alt=media&token=c0d77ce4-9a87-49a0-b957-572656f3ab2e',
          name: 'Music Teachers',
          id: 'music_teacher_art',
        ),
      ],
    );

    var fashion = Category(
      id: 'fashion',
      description: 'Check out some unique fashion Brands and accessories',
      image: 'assets/categories/fashion.jpg',
      name: 'Fashion Brands',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ffashion%2Fpexels-photo-1253413.jpeg?alt=media&token=92540407-62b0-4710-9bbf-854073571f30',
          name: 'Women Fashion',
          id: 'women_fashion',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ffashion%2Fpexels-photo-1484799.webp?alt=media&token=1b52f3ec-5685-4795-9250-fb8206f0fb9b',
          name: 'Men Fashion',
          id: 'men_fashion',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Faccesories.jpeg?alt=media&token=bff6fd63-e856-4807-b658-c2a769629297',
          name: 'Accessories',
          id: 'accessories_fashion',
        ),
        SubCategory(
          image: '',
          name: 'Unisex',
          id: 'unisex_fashion',
        ),
      ],
    );

    var education = Category(
      id: 'education',
      description: 'Services for learning and education',
      image: 'assets/categories/education1.jpg',
      name: 'Education',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Feducation%2Fpexels-photo-5905918.jpeg?alt=media&token=7e21ad7b-1d71-466d-bf88-7ec94ac4daab',
          name: 'Teachers & Tutorings',
          id: 'teacher_tutor_education',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Feducation%2Fpexels-photo-590493.webp?alt=media&token=f283ee66-81e0-4e4a-9cbc-718cc05394fc',
          name: 'Books & Literature',
          id: 'books_literature_education',
        ),
      ],
    );

    var beauty = Category(
      id: 'beauty',
      description: 'Feel fancy and give yourself a break',
      image: 'assets/categories/beauty1.jpg',
      name: 'Beauty, Barbers & Spas',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fbeauty%2Fphoto-1557349800-5b9b168f3f53.jpg?alt=media&token=8ad8a086-702a-4ac0-9831-9553945bc28f',
          name: 'Barbers & Hair Salons',
          id: 'barber_salon_beauty',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fbeauty%2Fpexels-photo-6593792.webp?alt=media&token=9e76bb0d-6b81-4b0b-aefa-5c17c0f21896',
          name: 'Make Up Artists & Cosmetics',
          id: 'makeup_cosmetics_beauty',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fbeauty%2Fphoto-1545185043-78ab5b7e0af2.jpg?alt=media&token=12b36d80-869e-40df-aa7b-9c061af09844',
          name: 'Lash Techs & Nail Aesthecians',
          id: 'lash_nail_beauty',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fbeauty%2Fpexels-photo-3852204.jpeg?alt=media&token=4cb691b3-d63d-4a31-9d6d-c65d057b3bc0',
          name: 'Skin Care & Beauty Stores',
          id: 'skincare_store_beauty',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fbeauty%2Fphoto-1598300188904-6287d52746ad.jpg?alt=media&token=60c8028e-23dd-4147-96cd-65268d2a0f50',
          name: 'Spas & Body Sculpt Treatment',
          id: 'spa_treatment_beauty',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fbeauty%2Fphoto-1568515045052-f9a854d70bfd.jpg?alt=media&token=2c7dd779-357b-4e2b-b614-50690c086e6f',
          name: 'Tattoo & Piercing',
          id: 'tattoo_piercing_beauty',
        ),
      ],
    );

    var groups = Category(
      id: 'group',
      description: 'Explore community support groups and churches',
      image: 'assets/categories/community1.jpg',
      name: 'Community Groups',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fgroups%2Fphoto-1437603568260-1950d3ca6eab.jpg?alt=media&token=66fc4883-5b3c-4272-bc49-33efa833daef',
          name: 'Churches',
          id: 'church_group',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fgroups%2Fphoto-1532629345422-7515f3d16bb6.jpg?alt=media&token=336979e2-5b82-4d36-a59f-89d0043615d6',
          name: 'Non profit organizations',
          id: 'non_profit_group',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fgroups%2Fpexels-photo-4262424.jpeg?alt=media&token=d8568218-b574-4d10-90c4-8569d9586ed6',
          name: 'Youth & Family Services',
          id: 'youth_family_group',
        ),
      ],
    );

    var service = Category(
      id: 'service',
      description:
          'Professional services providing as an intermediate between its client and consumers',
      image: 'assets/categories/services.jpg',
      name: 'Professional Services ',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fservices%2Fphoto-1502147676094-45a8696bcbe8.jpg?alt=media&token=a6da32de-8f14-40d8-a7b8-775c69bd210e',
          name: 'Media Services, Photography & Videography',
          id: 'media_photo_service',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fservices%2Fpexels-photo-905163.webp?alt=media&token=f0658164-9980-48de-a3f9-772b2e55f1c0',
          name: 'Marketing',
          id: 'marketing_service',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fservices%2Fphoto-1455390582262-044cdead277a.jpg?alt=media&token=0995a241-7a1e-40d4-9e39-24be305b5e36',
          name: 'Technical Writers & Resume Services',
          id: 'writers_resume_service',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fservices%2Fpexels-photo-8111895.webp?alt=media&token=2733720e-ff83-45cf-b7bd-88efe12f827d',
          name: 'Business Consultants',
          id: 'business_consultant_service',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fservices%2Fpexels-photo-3094799.jpeg?alt=media&token=3f9e3df4-0136-4438-b5b7-7aa253ed1eb3',
          name: 'Graphic Designers',
          id: 'graphic_designer_service',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fservices%2Fphoto-1581012771300-224937651c42.jpg?alt=media&token=939c35eb-2486-4db9-8868-09330fbcf61c',
          name: 'Travel Agents',
          id: 'travel_service',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fservices%2Fphoto-1599443015574-be5fe8a05783.jpg?alt=media&token=1406c6ce-2fc3-4bd6-ba38-89538bd5fed1',
          name: 'Veterinarians',
          id: 'vet_service',
        ),
      ],
    );

    var labour = Category(
      id: 'labour',
      description: 'Labour & Trade Services in the community',
      image: 'assets/categories/labour.jpg',
      name: 'Labours & Trade Services',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flabour%2Fpexels-photo-442151.webp?alt=media&token=e47cb42d-616c-4979-af1d-f9d2113b44f9',
          name: 'Electricians',
          id: 'electrician_labour',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flabour%2Fpexels-photo-4442490.webp?alt=media&token=b8207a32-daf4-4ce7-929b-093dec201469',
          name: 'Builders & Contractors',
          id: 'builder_contractor_labour',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flabour%2Fpexels-photo-6419128.jpeg?alt=media&token=e35a7509-6bbb-4908-870a-c03c4998f76a',
          name: 'Plumber & Hvac Tech\'s',
          id: 'plumber_labour',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flabour%2Fphoto-1563453392212-326f5e854473.jpg?alt=media&token=cde208cb-73bb-44fa-bbfb-a2808c8f9bd1',
          name: 'Cleaning Services',
          id: 'clean_labour',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flabour%2Fpexels-photo-6169668.jpeg?alt=media&token=1f3de92c-b1bb-4087-9aae-8814e523da61',
          name: 'Transport Logistics & Movers',
          id: 'transport_movers_labour',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flabour%2Fgarden-grass-meadow-green.jpg?alt=media&token=c50316a7-45b2-4c0a-a1bd-351a95bcfa2b',
          name: 'Lawn & Snow removal',
          id: 'lawn_snow_labour',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flabour%2Fphoto-1527778195942-f6a40cad2f09.jpg?alt=media&token=27dedc8b-0b08-41bd-803c-68b0d038a898',
          name: 'Labour work Services',
          id: 'work_labour',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fsecurity.jpeg?alt=media&token=658954f9-5352-47a6-ac25-fce090043580',
          name: 'Security',
          id: 'security_labour',
        ),
      ],
    );

    var legal = Category(
      id: 'legal',
      description:
          'Proper Presentatation and guidence is necessary going through Legal Situation',
      image: 'assets/categories/legal1.jpg',
      name: 'Legal Services',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flegal%2Fphoto-1423592707957-3b212afa6733.jpg?alt=media&token=dc762fb8-3915-4958-a090-8dc60e6211af',
          name: 'Immigration Law',
          id: 'immigration_legal',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flegal%2Fpexels-photo-5669619.webp?alt=media&token=66bbde3e-cd07-4440-b11f-33a625d46fb7',
          name: 'Employment & Business law',
          id: 'employement_business_legal',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flegal%2Fpexels-photo-6077447.webp?alt=media&token=b8283b4b-258b-44c0-ae51-4ba15391d6ef',
          name: 'Human rights Law',
          id: 'humanrights_legal',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Flegal%2Fpexels-photo-7298908.jpeg?alt=media&token=3aed2504-476b-42b6-8b00-b71a131b0a2d',
          name: 'Personal injury Law',
          id: 'injury_legal',
        ),
      ],
    );

    var technology = Category(
      id: 'tech',
      description:
          'Guiding you through Information Technology and Tech related topics',
      image: 'assets/categories/technology.jpeg',
      name: 'IT & Tech Services',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ftech%2Fpexels-photo-5926389.jpeg?alt=media&token=1c17ab8b-344c-474c-8eaf-f8706915223e',
          name: 'Web Developers & Software Design',
          id: 'developer_tech',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ftech%2Fphoto-1563920443079-783e5c786b83.jpg?alt=media&token=4479ffbb-f040-4cc8-a866-5215f4cdc727',
          name: 'Surveillance & Communication Services',
          id: 'surveillance_tech',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ftech%2Fphoto-1515940175183-6798529cb860.jpg?alt=media&token=54617e72-e76b-4dca-adcd-63445f183157',
          name: 'Computer, Phone & Gadgets Services',
          id: 'device_tech',
        ),
      ],
    );

    var entertainment = Category(
      id: 'entertainment',
      description:
          'Providing all entertainment services from social activites to event equipment rentals',
      image: 'assets/categories/entertainment1.jpg',
      name: 'Entertainments',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fentertainment%2Fpexels-photo-1543766.webp?alt=media&token=243e38b1-4897-44e0-b6ed-2161f8f78767',
          name: 'Games & Arcade Centers',
          id: 'games_arcade_entertainment',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fentertainment%2Fpexels-photo-669986.webp?alt=media&token=60354215-7a02-4397-b13c-a86821c83b8b',
          name: 'Event Planners & Promoters',
          id: 'event_plan_promote_entertainment',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fentertainment%2Fphoto-1511578314322-379afb476865.jpg?alt=media&token=11dabcdf-957a-4207-b5a9-c3ef237bd23f',
          name: 'Event venues & Studios',
          id: 'event_venue_studio_entertainment',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fentertainment%2Fphoto-1543282687-75e5cb83c585.jpg?alt=media&token=88345333-ad15-4622-b147-9703da7e2103',
          name: 'DJs',
          id: 'dj_entertainment',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fentertainment%2Fpexels-photo-2170387.jpeg?alt=media&token=b1d14981-c0b2-48e7-8e09-13601c7a8bc9',
          name: 'Festivals',
          id: 'festival_entertainment',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fentertainment%2Fpexels-photo-207474.jpeg?alt=media&token=1c077ef6-edc4-4565-aa37-a52e256fdbba',
          name: 'Event Equipment Rentals',
          id: 'equipment_rental_entertainment',
        ),
      ],
    );

    var realEstate = Category(
      id: 'real_estate',
      description: 'Let us guide you find your perfect dream home',
      image: 'assets/categories/real_estate1.jpg',
      name: 'Real Estate',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Freal%20estate%2Fphoto-1564767609342-620cb19b2357.jpg?alt=media&token=00fa43e1-273e-4dc6-9b61-63100b880ff2',
          name: 'Realtors',
          id: 'realtor_real_estate',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Freal%20estate%2Fphoto-1453945619913-79ec89a82c51.jpg?alt=media&token=72f36b16-b13f-45f9-9bd3-e37420176d07',
          name: 'Real estate Lawyers',
          id: 'lawyer_real_estate',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Freal%20estate%2Fphoto-1559067096-d109b66fd5af.jpg?alt=media&token=aee056e1-e091-496c-90e0-1e78e82fb617',
          name: 'Mortgage Brokers',
          id: 'broker_real_estate',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Freal%20estate%2Fphoto-1619634912816-8e6ab3b7d176.jpg?alt=media&token=071de89c-2bf0-4a6e-8034-3917d587c231',
          name: 'Property Management',
          id: 'management_real_estate',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Freal%20estate%2Fpexels-photo-298842.webp?alt=media&token=fe05620a-c8b1-470b-82f4-5b342a6667b1',
          name: 'Home staging',
          id: 'staging_real_estate',
        ),
      ],
    );

    var finance = Category(
      id: 'finance',
      description: 'Let us guide you through your finances',
      image: 'assets/categories/finance1.jpg',
      name: 'Financial Services',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ffinance%2Ffinancial%20literacy.jpg?alt=media&token=72b88d69-f04e-4b50-aed6-fe6c466fbe34',
          name: 'Financial Literacy',
          id: 'literacy_finance',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ffinance%2FTax-and-Accounting.jpg?alt=media&token=e40d5c95-f984-407d-9dfa-fbf5f2437356',
          name: 'Accountants & Tax Services',
          id: 'tax_accountant_finance',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ffinance%2Finsurance%20agent.jpg?alt=media&token=0722b6fa-f628-4bc2-80d5-05069c5d1a09',
          name: 'Insurance Agent',
          id: 'insurance_finance',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ffinance%2Finvestments.png?alt=media&token=de6d8919-91b7-4917-89aa-e8aab443f568',
          name: 'Investments',
          id: 'invest_finance',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Ffinance%2Fdebt%20relief.jpg?alt=media&token=b76636cc-f120-4dcb-9285-78e28ca085de',
          name: 'Debt Relief Service',
          id: 'debt_relief_finance',
        ),
      ],
    );

    var automotive = Category(
      id: 'automotive',
      description: 'Fixing, Buying & Selling of all your Automotive needs',
      image: 'assets/categories/automotive1.jpg',
      name: 'Cars & Automotives',
      subcategories: [
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fautomotives%2Fpexels-photo-4116170.jpeg?alt=media&token=db3a4e87-5ce7-4533-ae2d-e0fa2b94001f',
          name: 'Mechanics & Auto repairs',
          id: 'mechanic_automotive',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fautomotives%2Fpexels-photo-7144214.jpeg?alt=media&token=0dbcda41-ee9c-4a77-bdb7-1205386da606',
          name: 'Car Dealerships & Rentals',
          id: 'dealership_rental_automotive',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fautomotives%2Fphoto-1611083497391-971ad20e269a.jpg?alt=media&token=0f063de6-3a81-4fe2-aa1c-9ca5bc5d6f16',
          name: 'Towing',
          id: 'towing_automotive',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fautomotives%2FF8Npv15x3yELp8NYkU8Z.jpg?alt=media&token=427050a9-cfe7-4279-b50c-df6db6d97ce8',
          name: 'Car Detailing & Accessories',
          id: 'detailing_automotive',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fautomotives%2Fpexels-photo-5233258.jpeg?alt=media&token=e7f6c76b-85a8-4ed9-986a-49b60ad3704d',
          name: 'Body Shop & custum modifications',
          id: 'modifications_automotive',
        ),
        SubCategory(
          image:
              'https://firebasestorage.googleapis.com/v0/b/ebony-market.appspot.com/o/subcategoryImages%2Fhealth%2Fauto%20parts.jpeg?alt=media&token=4f40c319-72a6-46ac-bc72-cd1111112790',
          name: 'Parts',
          id: 'parts_automotive',
        ),
      ],
    );

    return [
      restaurants,
      retail,
      fashion,
      beauty,
      service,
      health,
      arts,
      education,
      realEstate,
      groups,
      labour,
      finance,
      legal,
      technology,
      entertainment,
      automotive,
    ];
  }
}

class SubCategory {
  String id;
  String image;
  String name;

  SubCategory({
    required this.image,
    required this.name,
    required this.id,
  });

  factory SubCategory.fromMap(map) {
    return SubCategory(
      image: map['image'],
      name: map['name'],
      id: map['id'],
    );
  }
}
