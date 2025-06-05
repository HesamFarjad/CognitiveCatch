# CognitiveCatch
An interactive Laravel web app for early detection of cognitive and mental disorders in children through gamified assessment.




# 🧠 Child Mental Health Diagnostic Game

An **AI-assisted, Laravel-based web application** designed for the **early detection of cognitive and mental disorders in children aged 5–12**, developed as part of a master's thesis at **Sapienza University of Rome**.

This project integrates **gamification**, **adaptive interfaces**, and **machine learning algorithms** to provide an accessible, engaging, and data-driven psychological screening experience.

---

## 📘 Project Overview

This platform provides an interactive, online environment where children engage with tests based on:
- 🎨 **Color recognition**
- 🔢 **Number sequences**
- 🔺 **Shape identification**

Alongside the game, behavioral data and a follow-up questionnaire are used to **identify patterns** and **support preliminary diagnosis** of conditions like ADHD, ASD, and learning disabilities.

The system was developed with guidance from both the **Faculty of Computer Engineering** and the **Faculty of Psychology**, blending technical innovation with clinical insight.

---

## 🧪 Core Features

- ✅ **Gamified psychological assessments**
- 🧩 **Adaptive UI** based on user interaction
- 🔐 **Admin & role-based access control** (doctors, admins)
- 📈 **Behavioral data collection** (response accuracy, reaction time, session flow)
- 📊 **Detailed exam reporting** per user
- 🧠 **Basic machine learning support** (e.g., Decision Trees, Neural Nets)

---

## 🧰 Tech Stack

- **Backend**: Laravel (PHP Framework)
- **Database**: MySQL
- **Frontend**: Blade templates, HTML, CSS, JavaScript
- **Local Dev**: XAMPP stack for deployment/testing
- **ML Models (planned)**: Decision Trees, Neural Networks, Reinforcement Learning

---

## 🚀 Getting Started

### Prerequisites
- PHP >= 8.1
- Composer
- MySQL
- XAMPP or Laravel Homestead (optional)

### Installation

```bash
git clone https://github.com/your-username/mental-health-game.git
cd mental-health-game
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve


🧑‍🏫 Research Context
This project is part of the thesis:

"Navigating Cognitive and Mental Disorders in Case of Children: An Innovative Approach through the Online Assessment"
Author: Hesam Farjad
Supervisor: Prof. Christian Napoli
University: Sapienza Università di Roma
Academic Year: 2023/2024

🛡️ Ethical & Educational Use
This project is open-sourced for academic, clinical, and research use only. It is not intended as a replacement for formal clinical diagnosis.

🌱 Future Directions
Integrate advanced ML models for behavioral pattern recognition

Add support for multilingual interfaces

Implement mobile-first design

Publish API endpoints for researcher integration

🤝 Acknowledgements
Special thanks to:

Dr. Valerio Ponzi & Dr. Samuele Russo (Co-Advisors)

The psychology and computer science departments at Sapienza University

All participants and testers who contributed to user evaluation and validation

📄 License
© 2023 Hesam Farjad
Released under a custom educational license. Contact for reuse or academic collaboration:
📧 farjad.1938534@studenti.uniroma1.it
