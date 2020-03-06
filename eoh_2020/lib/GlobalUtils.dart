class UserProgress {
  static const SOLVED_NONE = 0;
  static const SOLVED_BINARY = 1;
  static const SOLVED_SLIDING = 2;
  static const SOLVED_CHEST = 3;
}

class Item {
  String name;
  String description;
  String imageUrl;

  Item(this.name, this.description, this.imageUrl);
}

class User {
  int progress;
  List<Item> inventory;
  
  User() {
    progress = UserProgress.SOLVED_NONE;
    inventory = [];
  }
}

class GlobalUtils {
  static User user = User();

  // Gets the user's current progress as an int
  // refer to UserProgress class with constants
  static int getUserProgress() {
    return user.progress;
  }

  // Set the user's current progress
  // e.g. GlobalUtils.setUserProgress(UserProgress.SOLVED_BINARY)
  static void setUserProgress(int progress) {
    user.progress = progress;
  }

  // Check if a user has solved a certain puzzle
  // e.g. GlobalUtils.hasUserProgressPast(UserProgress.SOLVED_SLIDING)
  static bool hasUserProgressedPast(int progress) {
    return user.progress >= progress;
  }

  // Adds an item to the inventory if it doesn't already exist
  static void addItemToInventory(Item item) {
    if (!isItemInInventory(item)) {
      user.inventory.add(item);
    }
  }

  // Checks to see if an item is in the user's inventory
  static bool isItemInInventory(Item item) {
    for(var currItem in user.inventory) {
      if (item.name == currItem.name) {
        return true;
      }
    }
    return false;
  }
}