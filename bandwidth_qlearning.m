% Project: Intelligent Algorithm for Bandwidth in Wireless Network using Q-Learning

% Parameters
num_devices = 5;              % Number of devices
num_states = 10;              % Number of states (bandwidth levels)
num_actions = num_devices;    % Number of possible actions (each device can be allocated bandwidth)
learning_rate = 0.1;          % Learning rate
discount_factor = 0.9;        % Discount factor
num_episodes = 1000;          % Number of episodes for training

% Initialize Q-table
Q = zeros(num_states, num_actions);

% Initialize arrays to store performance metrics
cumulative_rewards = zeros(1, num_episodes);

% Training the Q-Learning agent
for episode = 1:num_episodes
    % Randomly initialize the state (bandwidth level)
    current_state = randi(num_states);
    total_reward = 0;
    
    % Loop until the end of the episode
    for step = 1:100
        % Choose action (device) using epsilon-greedy strategy
        epsilon = 1 / episode; % Decreasing exploration
        if rand < epsilon
            action = randi(num_actions); % Explore
        else
            [~, action] = max(Q(current_state, :)); % Exploit
        end
        
        % Simulate bandwidth allocation
        allocated_bandwidth = (rand(1, num_devices) > 0.5) .* (current_state / num_states * 100);
        
        % Calculate reward based on usage patterns
        usage_patterns = randi([1, 50], 1, num_devices); % Simulate usage patterns
        reward = sum(allocated_bandwidth .* usage_patterns) / sum(usage_patterns);
        total_reward = total_reward + reward;
        
        % Determine next state based on the action
        next_state = min(max(current_state + randi([-1, 1]), 1), num_states); % Randomly change state
        
        % Update Q-value
        Q(current_state, action) = Q(current_state, action) + learning_rate * ...
            (reward + discount_factor * max(Q(next_state, :)) - Q(current_state, action));
        
        % Transition to the next state
        current_state = next_state;
    end
    
    % Store cumulative reward for the episode
    cumulative_rewards(episode) = total_reward;
end

% Display the learned Q-table
disp('Learned Q-table:');
disp(Q);

% Display the optimal actions for each state
[~, optimal_actions] = max(Q, [], 2);
disp('Optimal actions for each state:');
disp(optimal_actions);

% Plot cumulative rewards over episodes
figure;
plot(1:num_episodes, cumulative_rewards, 'LineWidth', 1.5);
title('Cumulative Rewards Over Episodes');
xlabel('Episode');
ylabel('Cumulative Reward');
grid on;

% Visualize the Q-table as a heatmap
figure;
imagesc(Q);
colorbar;
title('Q-table Heatmap');
xlabel('Actions (Devices)');
ylabel('States (Bandwidth Levels)');
xticks(1:num_actions);
yticks(1:num_states);

% Plot optimal actions for each state
figure;
plot(1:num_states, optimal_actions, 'o-', 'LineWidth', 1.5);
title('Optimal Actions for Each State');
xlabel('State (Bandwidth Level)');
ylabel('Optimal Action (Device)');
grid on;
