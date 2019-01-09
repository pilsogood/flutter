
import 'package:flutter/material.dart';
import 'package:examples/ui/Swipe/model.dart';

class MatchEngine extends ChangeNotifier {
  final List<Matching> _matches;
  int _currentMatchIndex;
  int _nextMatchIndex;
  
  MatchEngine({
    List<Matching> matches,
  }) : _matches = matches {
    _currentMatchIndex = 0;
    _nextMatchIndex = 1;
  }

  Matching get currentMatch => _matches[_currentMatchIndex];
  Matching get nextMatch => _matches[_nextMatchIndex];

  void cycleMatch() {
    if(currentMatch.decision != Decision.undecied) {
      currentMatch.reset();

      _currentMatchIndex = _nextMatchIndex;
      _nextMatchIndex = _nextMatchIndex < _matches.length - 1 ? _nextMatchIndex + 1 : 0;

      notifyListeners();
    }
  }
}

class Matching extends ChangeNotifier { 

  final Profile profile;
  Decision decision = Decision.undecied;
  Matching({this.profile});

  void like() {
    if(decision == Decision.undecied) {
      decision = Decision.like;
      notifyListeners();
    }
  }
  
  void nope() {
    if(decision == Decision.undecied) {
      decision = Decision.nope;
      notifyListeners();
    }
  }

  void superlike() {
    if(decision == Decision.undecied) {
      decision = Decision.superlike;
      notifyListeners();
    }
  }

  void reset() {
    if(decision != Decision.undecied) {
      decision = Decision.undecied;
      notifyListeners();
    }
  }
  
}

enum Decision {
  undecied,
  nope,
  like,
  superlike,
}