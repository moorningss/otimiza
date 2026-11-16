# Unconstrained Optimization Benchmark: Line Search Methods

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023a%2B-orange.svg)](https://www.mathworks.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This repository implements and benchmarks unconstrained optimization algorithms using Cauchy's steepest descent direction coupled with different line search strategies across the classic Moré-Garbow-Hillstrom (MGH) test problem collection.

## 📌 Project Context

This codebase originated from my Undergraduate Scientific Initiation (*Iniciação Científica*) research at the **Universidade Tecnológica Federal do Paraná (UTFPR)**, Curitiba, Brazil. 

**Important Note on Scope:** While the core mathematical formulation is rooted in the original academic research, **this repository is an autonomous software refactoring and independent extension developed**. It is not a strict 1:1 replica of the scripts used in the official academic presentations. Independent modifications include:
- Unified modular architecture (`OTIMIZACAO.m`, `cauchy.m`, `busca_linear.m`, `mgh.m`, `banco_f.m`).
- Strict numerical exception handling (`NaN`/`Inf` interception and global iteration ceiling enforcement across all sub-routines).
- Automated Dolan-Moré performance profile generation directly integrated into the main benchmark pipeline.
- Ongoing independent extensions (such as Python/NumPy migration and Strong Wolfe conditions).

## 🛠️ Implemented Methods

- **Descent Direction:** Cauchy's Gradient Descent ($d = -\nabla f(x)$).
- **Line Search Strategies:**
  1. **Armijo Condition** (backtracking line search).
  2. **Golden Section Method** (exact derivative-free bracketed search).
  3. **Bisection Method** (directional derivative root-finding).
- **Performance Evaluation:** 
  - CPU execution time tracking with strict failure penalization (`Inf`).
  - **Dolan-Moré Performance Profiles** for robustness and efficiency analysis.

## 📂 Repository Structure

- `OTIMIZACAO.m`: Main benchmark runner for the 33 MGH problems and Dolan-Moré plotter.
- `cauchy.m`: Steepest descent solver with numerical overflow/underflow safeguards.
- `busca_linear.m`: Unified line search module housing Armijo, Golden Section, and Bisection.
- `mgh.m`: Analytical wrapper computing $f(x) = F(x)^T F(x)$ and $\nabla f(x) = 2 J(x)^T F(x)$.
- `banco_f.m`: Setup database for the 33 MGH test problems (dimensions $n, m$ and initial points $x_0$).

## 🚀 Getting Started

1. Clone this repository to your local machine.
2. Open **MATLAB** and navigate to the repository folder.
3. Run the main benchmark script:
   ```matlab
   OTIMIZACAO
