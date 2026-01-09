# Chrome-Boost
Ce script est un outil d'optimisation de bas niveau conçu pour maximiser les performances de Google Chrome et la réactivité réseau sous Windows. This script is a low-level optimization tool designed to maximize Google Chrome performance and network responsiveness on Windows.

# 🚀 Simple CRM - Ultimate Windows & Chrome Optimizer

Ce script est un outil d'optimisation de bas niveau conçu pour maximiser les performances de **Google Chrome** et la réactivité réseau sous **Windows**. Initialement développé pour fluidifier l'usage de [Simple CRM](https://simple-crm.ai), il bénéficie à toute application Web exigeante.

## 🇫🇷 Version Française

### 🌟 Bénéfices

* **Navigation Ultra-Rapide :** Réduction du temps de latence grâce à l'intégration des DNS Cloudflare (1.1.1.1).
* **Fluidité d'Affichage :** Force le rendu graphique via le GPU (carte vidéo), libérant ainsi le processeur (CPU) pour les tâches de calcul.
* **Priorité Système :** Alloue plus de ressources CPU à Chrome, empêchant les autres applications de ralentir votre navigation.
* **Optimisation Réseau :** Ajuste les paquets MTU et le TCP Autotuning pour éviter la fragmentation des données sur la Fibre et l'ADSL.

### 🛠️ Ce que le script modifie

1. **Réseau :** Passage aux DNS Cloudflare (IPv4 & IPv6), réglage du MTU à 1500 et activation du RSS (Receive Side Scaling).
2. **Chrome :** Activation de la *Zero-Copy Rasterization* et du téléchargement parallèle via des arguments de lancement spécifiques.
3. **Système :** Passage de Windows en mode "Hautes Performances" et élévation de la priorité du processus `chrome.exe`.

### ⚠️ Installation

1. Téléchargez le fichier `SimpleCRM_Booster.bat`.
2. Faites un **clic-droit** sur le fichier.
3. Choisissez **"Exécuter en tant qu'administrateur"**.
4. Suivez les instructions à l'écran.

---

## 🇺🇸 English Version

### 🌟 Key Benefits

* **Ultra-Fast Browsing:** Significant reduction in latency by integrating Cloudflare DNS (1.1.1.1).
* **Smooth UI Rendering:** Forces GPU hardware acceleration for web pages, offloading the CPU for heavy data processing.
* **System Priority:** Grants "High Priority" CPU status to Chrome, preventing background apps from causing lag.
* **Network Optimization:** Fine-tunes MTU settings and Windows TCP Autotuning to eliminate data fragmentation on high-speed connections.

### 🛠️ Technical Modifications

1. **Networking:** Switches to Cloudflare DNS (IPv4 & IPv6), sets MTU to 1500, and enables RSS (Receive Side Scaling).
2. **Chrome Engine:** Enables *Zero-Copy Rasterization*, Parallel Downloading, and QUIC protocol via optimized launch flags.
3. **Windows System:** Forces "High Performance" power scheme and elevates `chrome.exe` process priority.

### ⚠️ How to Use

1. Download the `SimpleCRM_Booster.bat` file.
2. **Right-click** the file.
3. Select **"Run as Administrator"**.
4. Follow the on-screen menu instructions.

---

## 📜 Disclaimer / Clause de responsabilité

*Ce script modifie des paramètres système profonds. L'utilisation se fait à vos propres risques. Ni l'éditeur de Simple CRM, ni les contributeurs ne peuvent être tenus responsables de toute instabilité système.*

*This script modifies deep system settings. Use it at your own risk. Neither Simple CRM nor the contributors shall be held liable for any system instability.*
