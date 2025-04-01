import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/resources/resources.dart';
import '../data/model/event_model.dart';

class EventsController extends GetxController {
  //TODO: Implement EventsController
  TextEditingController startDateC = TextEditingController();
  TextEditingController endDateC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  TextEditingController codeCouponC = TextEditingController();
  TextEditingController websiteLinkC = TextEditingController();
  TextEditingController socialLinkC = TextEditingController();

  RxBool isShowEventForm = false.obs;

  // Tambahkan variable untuk menyimpan event yang dipilih
  Rx<EventModel?> selectedEvent = Rx<EventModel?>(null);

  // Gunakan Map untuk menyimpan status seleksi setiap item
  final RxMap<String, bool> selectedItems = <String, bool>{}.obs;

  // Map untuk menyimpan quantity setiap item
  final RxMap<String, int> itemQuantities = <String, int>{}.obs;

  // Map untuk menyimpan harga setiap item
  final Map<String, double> itemPrices = {};

  // Tambahkan RxDouble untuk nilai range
  RxDouble startPrice = 500.0.obs;
  RxDouble endPrice = 10200.0.obs;

  // Untuk nilai yang sedang di-drag
  RxDouble currentStartPrice = 500.0.obs;
  RxDouble currentEndPrice = 10200.0.obs;

  // Hitung rata-rata harga
  double get averagePrice =>
      (currentStartPrice.value + currentEndPrice.value) / 2;

  final selectedCategory = Rxn<String>();

  final List<String> eventCategories = [
    'Afro beats event',
    'Reggae dancehall',
    'Soca and Calypso',
    'Hip hop and rap',
    'R&B and soul',
    'Parties',
    'Festivals & cultural events',
    'Business & Networking',
    'Church & religious',
    'Fundraising Events',
    'Sports Events',
    'Comedy Events',
    'Carnival',
    'Boat parties',
  ];

  final searchController = TextEditingController();
  final selectedCategories = <String>[].obs;
  final filteredEvents = <EventModel>[].obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    filteredEvents.value = eventsDummy;
  }

  void toggleEventForm() {
    isShowEventForm.value = !isShowEventForm.value;
  }

  final List<EventModel> eventsDummy = [
    EventModel(
      image: Images.dummyEvent1,
      name: 'Coldplay Concert Tour 2025',
      date: 'Feb 14, 2025 09:30 PM - Feb 14, 2025 11:30 PM',
      location: 'Seaver Stadium, Los Angeles',
      price: '50.00',
      description:
          'Coldplay is a British rock band that was formed in 1996 in London. The band consists of four members: Chris Martin, Jonny Buckland, Guy Berryman, and Will Champion. The band is known for its unique blend of rock, pop, and electronic music.',
      distance: 14.0,
      category: 'Festivals & cultural events',
    ),
    EventModel(
      image: Images.dummyEvent2,
      name: 'Carnival in the park ',
      date: 'Feb 10, 2025 03:00 PM - Feb 11, 2025 11:30 PM',
      location: 'Rio de Janeiro, Brazil',
      price: '10.00',
      description:
          'Carnival in the park is a popular event that takes place in Rio de Janeiro, Brazil. The event is known for its unique blend of music, dance, and food.',
      distance: 11.0,
      category: 'Carnival',
    ),
    EventModel(
      image: Images.dummyEvent3,
      name: 'Music Festival Dj Mix',
      date: 'Mar 14, 2025 09:30 PM - Mar 15, 2025 11:30 PM',
      location: 'Commonwealth Stadium, Edmonton',
      price: '35.00',
      description:
          'Music Festival Dj Mix is a popular event that takes place in Edmonton, Canada. The event is known for its unique blend of music, dance, and food.',
      distance: 18.0,
      category: 'Parties',
    ),
  ];

  // Method untuk set selected event
  void setSelectedEvent(EventModel event) {
    selectedEvent.value = event;
  }

  // Method untuk toggle seleksi specific item
  void toggleSelection(String itemId) {
    if (selectedItems.containsKey(itemId)) {
      selectedItems[itemId] = !selectedItems[itemId]!;
    } else {
      selectedItems[itemId] = true;
    }
  }

  // Check status seleksi item
  bool isItemSelected(String itemId) {
    return selectedItems[itemId] ?? false;
  }

  // Reset semua selection
  void clearSelections() {
    selectedItems.clear();
  }

  void increaseQuantity(String itemId) {
    itemQuantities[itemId] = (itemQuantities[itemId] ?? 0) + 1;
  }

  void decreaseQuantity(String itemId) {
    if ((itemQuantities[itemId] ?? 0) > 1) {
      itemQuantities[itemId] = itemQuantities[itemId]! - 1;
    }
  }

  int getQuantity(String itemId) {
    return itemQuantities[itemId] ?? 1;
  }

  double getItemPrice(String itemId) {
    return (itemPrices[itemId] ?? 0) * getQuantity(itemId);
  }

  double getTotalPrice() {
    double total = 0;
    for (var entry in selectedItems.entries) {
      if (entry.value) {
        total += getItemPrice(entry.key);
      }
    }
    return total;
  }

  @override
  void clearSelectedEvent() {
    selectedEvent.value = null;
    clearSelections();
    itemQuantities.clear();
  }

  @override
  void onClose() {
    clearSelectedEvent();
    super.onClose();
  }

  // Method untuk update range
  void updatePriceRange(RangeValues values) {
    currentStartPrice.value = values.start;
    currentEndPrice.value = values.end;
  }

  void searchEvents(String query) {
    searchQuery.value = query;
    applyFilters();
  }

  void addCategory(String category) {
    if (!selectedCategories.contains(category)) {
      selectedCategories.add(category);
    }
  }

  void removeCategory(String category) {
    selectedCategories.remove(category);
    applyFilters();
  }

  void clearFilters() {
    selectedCategories.clear();
    searchController.clear();
    searchQuery.value = '';
    filteredEvents.value = eventsDummy;
  }

  void applyFilters() {
    filteredEvents.value = eventsDummy.where((event) {
      bool matchesSearch = searchQuery.value.isEmpty ||
          event.name.toLowerCase().contains(searchQuery.value.toLowerCase());

      bool matchesCategories = selectedCategories.isEmpty ||
          selectedCategories.contains(event.category);

      return matchesSearch && matchesCategories;
    }).toList();
  }
}
