final List<Profile> demoProfiles = [
  new Profile(
    photos: [
      'assets/images/profile/profile-1.jpg',
      'assets/images/profile/profile-2.jpg',
    ],
    name: 'pilsogood',
    bio: 'This is the person you want!',
  ),
  new Profile(
    photos: [
      'assets/images/profile/profile-3.jpg',
      'assets/images/profile/profile-4.jpg',
    ],
    name: 'super dog',
    bio: 'You better swipe left...',
  ),
  new Profile(
    photos: [
      'assets/images/profile/profile-5.jpg',
      'assets/images/profile/profile-6.jpg',
    ],
    name: 'super dog',
    bio: 'You better swipe left...',
  ),
  new Profile(
    photos: [
      'assets/images/profile/profile-1.jpg',
      'assets/images/profile/profile-2.jpg',
    ],
    name: 'pilsogood',
    bio: 'This is the person you want!',
  ),
  new Profile(
    photos: [
      'assets/images/profile/profile-3.jpg',
      'assets/images/profile/profile-4.jpg',
    ],
    name: 'super dog',
    bio: 'You better swipe left...',
  ),
  new Profile(
    photos: [
      'assets/images/profile/profile-5.jpg',
      'assets/images/profile/profile-6.jpg',
    ],
    name: 'super dog',
    bio: 'You better swipe left...',
  ),
];

class Profile {
  final List<String> photos;
  final String name;
  final String bio;

  Profile({
    this.photos,
    this.name,
    this.bio,
  });
}