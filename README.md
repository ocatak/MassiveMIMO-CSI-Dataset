# MassiveMIMO-CSI-Dataset

A comprehensive **Massive MIMO Channel State Information (CSI) dataset** designed for **next-generation wireless communication research** and **artificial intelligence/machine learning (AI/ML) applications**. This dataset is a valuable resource for researchers in **5G/6G networks**, **Massive MIMO**, and **data-driven AI methodologies**.

---

## **Key Features**
- **Realistic Scenarios**: Includes stationary, high-speed mobility, and urban macrocell environments based on 3GPP standards.
- **Versatility**: Designed for applications such as **scenario classification**, **anomaly detection**, and **CSI prediction** using machine learning and deep learning.
- **Reproducibility**: Accompanied by a MATLAB script to generate the dataset and Jupyter Notebook examples to explore its use cases.

---

## **Why Use This Dataset?**
This dataset bridges the gap between **AI/ML research** and **wireless communication** by providing:
1. **Comprehensive Data**: Incorporates realistic channel profiles, user mobility models, and noise conditions.
2. **Benchmarking**: Ideal for benchmarking ML/DL models in Massive MIMO research.
3. **Wide Applicability**: Supports research in areas such as:
   - Channel estimation and prediction.
   - Intelligent reflecting surfaces (IRS).
   - Spectrum sensing and beamforming.

---

## **Repository Contents**
1. **`foundation_model_data_generator.m`**: MATLAB script to generate the Massive MIMO CSI dataset.
2. **`examples/` Directory**: Jupyter Notebook examples demonstrating dataset use cases, such as:
   - Scenario classification (e.g., stationary vs. high-speed mobility).
   - Anomaly detection using Autoencoders and Isolation Forests.
   - CSI prediction with regression models.

---

## **Access the Dataset**
You can either:
1. **Generate the Dataset**: Use the MATLAB script included in this repository to generate your own dataset.
2. **Download the Pre-Generated Dataset**: The pre-generated dataset is available on Zenodo for direct download:
   - [Massive MIMO CSI Dataset on Zenodo](https://zenodo.org/) *(Add the actual link once available)*

---

## **How to Use**
### **1. Generate the Dataset**
- Install MATLAB with the 5G Toolbox.
- Run the provided script `foundation_model_data_generator.m`.
- The generated `.mat` file will be saved locally.

### **2. Analyze the Dataset**
- Open the Jupyter Notebook examples under the `examples/` directory.
- Use Python libraries to visualize and analyze the dataset. Example tasks include:
  - Scenario classification.
  - Anomaly detection.
  - CSI magnitude prediction.

---

## **Target Audience**
This dataset is particularly useful for:
- **Wireless Communication Researchers** working on **Massive MIMO**, **5G/6G networks**, and **smart wireless systems**.
- **AI/ML Practitioners** interested in applying machine learning to real-world wireless datasets.

---

## **Keywords**
- Massive MIMO CSI Dataset
- 5G and 6G wireless networks
- Channel State Information for AI/ML
- Wireless communication datasets
- Machine learning in wireless systems
- Next-generation networks dataset

---

## **Dependencies**
To use the Jupyter Notebook examples:
- Required libraries: `numpy`, `matplotlib`, `scipy`, `pandas`, `seaborn`, `scikit-learn`, `tensorflow`.
- Install dependencies with:
```bash
pip install -r requirements.txt
```

---

## **License**
This project is licensed under **Creative Commons Attribution 4.0 International (CC BY 4.0)**. You are free to use, modify, and share this dataset with proper attribution.

---

## **How to Cite**
If you use this dataset in your research, please cite:
```
Ferhat Ozgur Catak. "Massive MIMO CSI Dataset for Next-Generation Networks Research." Zenodo, 2024.
```

---

## **Contact**
For questions or collaborations, contact:
- **Name**: Ferhat Ozgur Catak
- **Email**: f.ozgur.catak@uis.no
- **Institution**: University of Stavanger

---

## **Call to Action**
Explore the dataset today and accelerate your research in **Massive MIMO**, **5G/6G networks**, and **AI/ML-driven wireless communication solutions**!
