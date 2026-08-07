# Intelligent Algorithm for Bandwidth Distribution in Wireless Networks

A Q-learning based approach to dynamic bandwidth allocation in wireless networks, developed as a graduation thesis project for the B.Sc. (Hon) in Telecommunication Engineering at Future University (2024).

## Overview

Traditional bandwidth allocation methods (e.g., Round Robin, Proportional Fairness) rely on static, predefined rules that struggle to adapt to the dynamic conditions of modern wireless networks — fluctuating traffic loads, user mobility, and interference. This project explores **reinforcement learning (Q-learning)** as an alternative: an agent that learns an allocation policy through repeated interaction with a simulated network environment, aiming to improve:

- **Throughput** — maximizing total data rate while minimizing congestion
- **Fairness** — distributing resources equitably across users/devices
- **Adaptability** — adjusting to changing traffic and network conditions
- **Quality of Service (QoS)** — meeting latency and reliability requirements

## Methodology

The implementation models bandwidth levels as a discrete state space and devices as the action space. The agent is trained with an epsilon-greedy exploration strategy (decaying exploration rate) over 1,000 episodes, updating a Q-table via the standard Bellman update rule.

**Parameters:**
- 5 devices (action space)
- 10 discrete bandwidth levels (state space)
- Learning rate: 0.1
- Discount factor: 0.9
- Episodes: 1,000

## Results

The script outputs:
- The learned Q-table and the optimal action per state
- Cumulative reward progression over training episodes
- A Q-table heatmap visualizing learned values across states and actions

## Repository Contents

| File | Description |
|---|---|
| `bandwidth_qlearning.m` | MATLAB/Octave implementation of the Q-learning training loop and result visualization |

## Running the Simulation

Requires MATLAB or GNU Octave.

```
octave bandwidth_qlearning.m
```

or open and run `bandwidth_qlearning.m` directly in MATLAB.

## Notes & Future Work

This implementation demonstrates the core Q-learning mechanism (state tracking, epsilon-greedy action selection, Q-table updates) in a simplified simulated environment. A natural next step — noted as future work — is tightening the coupling between the agent's chosen action and the simulated bandwidth allocation/state transition, so the learned policy more directly reflects action-driven outcomes rather than the current simplified environment model.

## Authors

- Saeed Atif Alhaj
- Ahmed EsamEldeen

**Supervisor:** Dr. Ashraf Gasm Alseed
Faculty of Telecommunication and Space Technology, Future University — 2024
