//
//  Emotions.swift
//  InnerCompass
//
//  Created by Arturo Alfani on 15/04/23.
//

import Foundation

struct Emotion: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var category: String
}

let emotions: [Emotion] = [
    Emotion(name: "Empowered", description: "You feel more confident and independent because of something that happened", category: "HighPleasant"),
    Emotion(name: "Inspired", description: "You feel motivated to act because something affected you positively", category: "HighPleasant"),
    Emotion(name: "Determined", description: "You know what you want to achieve and you are willing to work hard for it", category: "HighPleasant"),
    Emotion(name: "Excited", description: "You feel enthusiasm thinking about the future", category: "HighPleasant"),
    Emotion(name: "Eager", description: "You feel impatient and strongly desire to do something", category: "HighPleasant"),
    Emotion(name: "Productive", description: "You feel satisfied with what you accomplished or achieved", category: "HighPleasant"),
    Emotion(name: "Proud", description: "You feel pleased with your own achievements or those of someone you care about", category: "HighPleasant"),
    Emotion(name: "Happy", description: "You feel filled with joy, your heart feels warm", category: "HighPleasant"),
    Emotion(name: "Engaged", description: "You are paying full attention to something", category: "HighPleasant"),
    Emotion(name: "Hopeful", description: "You feel optimistic about the future and believe that something good will happen", category: "HighPleasant"),
    Emotion(name: "Delighted", description: "You feel highly pleased and lifted by joy", category: "HighPleasant"),
    Emotion(name: "Playful", description: "You feel lighthearted and happy", category: "HighPleasant"),
    Emotion(name: "Curious", description: "You feel interested in learning something", category: "HighPleasant"),
    Emotion(name: "Alive", description: "You feel full of energy and vitality", category: "HighPleasant"),
    Emotion(name: "Confident", description: "You believe in yourself and feel capable of facing challenges", category: "HighPleasant"),
    Emotion(name: "Joyful", description: "You feel full of energy and positive", category: "HighPleasant"),
    Emotion(name: "Amazed", description: "You feel lost in wonder about something", category: "HighPleasant"),
    Emotion(name: "Cheerful", description: "You feel optimistic and like you are enjoying life", category: "HighPleasant"),
    
    Emotion(name: "Calm", description: "You feel free of worry and agitation", category: "LowPleasant"),
    Emotion(name: "Understood", description: "You feel seen and listened to", category: "LowPleasant"),
    Emotion(name: "Respected", description: "You feel like someone thinks highly of you", category: "LowPleasant"),
    Emotion(name: "Fulfilled", description: "You feel like you have accomplished something important in your life", category: "LowPleasant"),
    Emotion(name: "Connected", description: "You feel close to someone, a group of people, nature of even yourself", category: "LowPleasant"),
    Emotion(name: "Loved", description: "You feel like someone really cares about you", category: "LowPleasant"),
    Emotion(name: "Appreciated", description: "You feel recognized and worthy for something you have done or for who you are", category: "LowPleasant"),
    Emotion(name: "Included", description: "You feel part of a group or a community", category: "LowPleasant"),
    Emotion(name: "Safe", description: "You feel physically or emotionally secure, protected from danger", category: "LowPleasant"),
    Emotion(name: "Grateful", description: "You appreciate something or someone and feel thankful", category: "LowPleasant"),
    Emotion(name: "Empathetic", description: "You understand someone else's feelings or emotions", category: "LowPleasant"),
    Emotion(name: "Carefree", description: "You feel relaxed, free of worry and happy with your life as it is", category: "LowPleasant"),
    Emotion(name: "Supported", description: "You feel like someone is there for you", category: "LowPleasant"),
    Emotion(name: "Blessed", description: "You feel very fortunate for what you have", category: "LowPleasant"),
    Emotion(name: "Moved", description: "You feel suddenly touched after seeing something meaningful, inspirational or sad", category: "LowPleasant"),
    Emotion(name: "Valued", description: "You feel like you matter", category: "LowPleasant"),
    Emotion(name: "Relaxed", description: "You feel free from anxiety", category: "LowPleasant"),
    Emotion(name: "Peaceful", description: "You feel quiet and untroubled", category: "LowPleasant"),
    
    Emotion(name: "Insecure", description: "You feel uncertain and not confident about yourself", category: "LowUnpleasant"),
    Emotion(name: "Sad", description: "You feel unhappy about something", category: "LowUnpleasant"),
    Emotion(name: "Disappointed", description: "You feel that your expectations were not met", category: "LowUnpleasant"),
    Emotion(name: "Vulnerable", description: "You feel that you could be easily hurt by something or someone", category: "LowUnpleasant"),
    Emotion(name: "Disconnected", description: "You feel separate from someone else", category: "LowUnpleasant"),
    Emotion(name: "Numb", description: "You feel hopeless and discouraged", category: "LowUnpleasant"),
    Emotion(name: "Ashamed", description: "You feel lower self-worth as a consequence of what you did or who you are", category: "LowUnpleasant"),
    Emotion(name: "Lost", description: "You feel like you are alone and lacking direction", category: "LowUnpleasant"),
    Emotion(name: "Guilty", description: "You feel responsible for something wrong you did", category: "LowUnpleasant"),
    Emotion(name: "Excluded", description: "You feel unwanted and left out", category: "LowUnpleasant"),
    Emotion(name: "Discouraged", description: "You feel a loss of confidence and pessimistic", category: "LowUnpleasant"),
    Emotion(name: "Apathetic", description: "You feel little to no enthusiasm or interest", category: "LowUnpleasant"),
    Emotion(name: "Nostalgic", description: "You miss the of happiness you felt in the past or in another place", category: "LowUnpleasant"),
    Emotion(name: "Hopeless", description: "You feel defeated and extremely worried about the future", category: "LowUnpleasant"),
    Emotion(name: "Exhausted", description: "You feel completely deprived of energy", category: "LowUnpleasant"),
    Emotion(name: "Bored", description: "You feel like you lack interest in something or someone", category: "LowUnpleasant"),
    Emotion(name: "Miserable", description: "You feel extremely upset about something or someone", category: "LowUnpleasant"),
    Emotion(name: "Trapped", description: "You feel like a prisoner of a certain situation", category: "LowUnpleasant"),
    
    Emotion(name: "Annoyed", description: "You feel bothered by something or someone", category: "HighUnpleasant"),
    Emotion(name: "Overwhelmed", description: "You feel like there is too much to handle", category: "HighUnpleasant"),
    Emotion(name: "Pressured", description: "You feel a strong sense of responsibility, as if something important depended on you", category: "HighUnpleasant"),
    Emotion(name: "Furious", description: "You feel full of anger towards something or someone", category: "HighUnpleasant"),
    Emotion(name: "Stressed", description: "You feel mentally strained from too many demands and not enough time", category: "HighUnpleasant"),
    Emotion(name: "Anxious", description: "You feel constantly worried about an uncertain outcome", category: "HighUnpleasant"),
    Emotion(name: "Tense", description: "You feel unable to relax", category: "HighUnpleasant"),
    Emotion(name: "Jealous", description: "You feel that an important relationship is threatened", category: "HighUnpleasant"),
    Emotion(name: "Jittery", description: "You feel on the edge and jumpy", category: "HighUnpleasant"),
    Emotion(name: "Angry", description: "You feel a strong displeasure or hostility because of a perceived injustice", category: "HighUnpleasant"),
    Emotion(name: "Embarassed", description: "You feel self-conscious and uncomfortable about how you think others perceive you", category: "HighUnpleasant"),
    Emotion(name: "Worried", description: "You feel troubled about something", category: "HighUnpleasant"),
    Emotion(name: "Envious", description: "You feel a desire for something that someone has", category: "HighUnpleasant"),
    Emotion(name: "Nervous", description: "You feel jumpy and worried about some future event", category: "HighUnpleasant"),
    Emotion(name: "Frustrated", description: "You feel upset because of something out of your control", category: "HighUnpleasant"),
    Emotion(name: "Irritated", description: "You feel feel slightly angry with something or someone", category: "HighUnpleasant"),
    Emotion(name: "Repulsed", description: "You feel disgusted or nauseated by someone or something", category: "HighUnpleasant"),
    Emotion(name: "Shocked", description: "You feel a sense of deeply unpleasant surprise, extreme horror or disgust", category: "HighUnpleasant")
]
    

