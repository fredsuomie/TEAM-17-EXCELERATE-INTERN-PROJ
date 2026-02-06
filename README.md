📘 LearnSphere
Reflect • Assess • Grow

LearnSphere is a Flutter-based self-assessment and reflection mobile application designed to help learners evaluate their understanding, reflect on learning experiences, and track confidence-based progress over time.

This project was developed as part of a Mobile Application Development Internship, following a team-based GitHub workflow and real-world app architecture practices.

🎯 Project Purpose

Most learning apps focus only on content delivery. LearnSphere focuses on metacognition — helping learners understand how well they are learning.

The app enables users to:

Perform confidence-based self-assessments

Reflect on learning challenges and strengths

Receive AI-assisted feedback

Track learning progress visually

Build consistent reflection habits

✨ Core Features
🔹 Program-Based Learning Flow

Users select a learning program

Progress is tracked per program

Reflection and progress are locked until assessment completion

🔹 Self-Assessment (AI-Assisted Logic)

Confidence rating scale (Very Confident → Not Confident)

Topic-based assessment

Dynamic feedback generation based on confidence score

ℹ️ AI Usage Note
The current implementation uses rule-based and API-assisted logic to simulate AI behavior.
The app does not train models, aligning with internship requirements.

🔹 Reflection Journal

Guided reflection questions

User-written reflections

Validation to ensure meaningful input

🔹 Progress Overview

Confidence scoring system

Progress percentage per program

Visual indicators of learning growth

🧭 Application Flow
Login 
  → Program List 
    → Self-Assessment 
      → Reflection 
        → Progress Overview


Reflection and Progress screens remain locked until the user completes a self-assessment.

🧪 Forms & Validation

The app includes functional forms with validation:

Authentication inputs

Self-assessment submission

Reflection text inputs

Required field checks and user feedback

🛠️ Tech Stack

Flutter – Cross-platform mobile development

Dart – Programming language

Firebase Authentication – User authentication

Mock JSON / Services – Program data handling

AI-assisted logic – Feedback & progression

Git & GitHub – Version control and collaboration

🖼️ UI & Wireframes

High-fidelity wireframes were designed to define the user experience before development.

Key Screens:

Login / Signup

Dashboard

Program Listing

Self-Assessment

Reflection Journal

Progress Overview

▶️ Demo

A short demo video showcases:

Program selection

Self-assessment submission

AI-assisted feedback

Reflection flow

Progress tracking

🚀 Setup Instructions
git clone <repository-url>
flutter pub get
flutter run


API keys are secured using environment variables and are not committed to the repository.
