final List<Profile> demoProfiles = [
  new Profile(
    photos: [
      'assets/images/profile.jpg',
      'assets/images/profile.jpg',
      'assets/images/profile.jpg',
      'assets/images/profile.jpg',
    ],
    name: 'pilsogood',
    bio: 'This is the person you want!',
  ),
  new Profile(
    photos: [
      'assets/images/dog.jpeg',
      'assets/images/dog.jpeg',
      'assets/images/dog.jpeg',
      'assets/images/dog.jpeg',
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