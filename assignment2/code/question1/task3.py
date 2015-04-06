""" Module to complete task 3"""
__author__ = 'eng-188do'
__date__ = '24/03/15'

import numpy as np
import matplotlib.pyplot as plt
from functools import partial
import warnings
from task2 import save_plot_then_clear


def run_euler_iterations(time_steps, delta_t, r0, deriv_func):
    # Storage containers for the simulation
    rate_storage = np.zeros((r0.size, time_steps))
    rate_storage[:, 0] = r0
    time_storage = np.arange(0, time_steps) * delta_t
    r = np.array(r0)

    for t in range(1, time_steps):
        r += deriv_func(r)*delta_t
        rate_storage[:, t] = r.copy()

    return rate_storage, time_storage, r

def calc_deriv(h_input, lambda_val, tau_val, cos_matrix, delta_theta, r_vector):
    rect_term = h_input +lambda_val / np.pi * delta_theta * np.dot(cos_matrix, r_vector)
    rect_term[ rect_term < 0] = 0  # rectify
    deriv_func =  (-r_vector + rect_term)/tau_val
    return deriv_func

def calc_deriv_linear(h_input, lambda_val, tau_val, cos_matrix, delta_theta, r_vector):
    rect_term = h_input +lambda_val / np.pi * delta_theta * np.dot(cos_matrix, r_vector)
    #Note no rectification
    deriv_func =  (-r_vector + rect_term)/tau_val
    return deriv_func


if __name__ == '__main__':
    warnings.simplefilter('error')

    # Set the seed:
    rng = np.random.RandomState(100)

    # Set up some network and simualtion properties:
    network_size = 100
    theta = np.linspace(-np.pi, np.pi, network_size)  #discretise the angle
    delta_theta = theta[1]-theta[0]
    delta_t = 0.001  # time step
    final_t = 500
    time_steps = int(np.ceil(final_t / delta_t) + 1)  # the +1 is for time zero




    h_input = 5 * np.exp(-2 * theta ** 2) + rng.randn(
        theta.size)  # note the assumption here that the Gaussian is redrawn for each angle


    # # Task 3ai
    plt.figure()
    plt.plot(theta, 5 * np.exp(-2 * theta ** 2), '--', label='h before noise', color='#20B2AA')
    plt.plot(theta, h_input, label='h', color='#87CEFA')
    plt.xlabel('$\\theta$')
    plt.ylabel('$h(\\theta)$')
    plt.legend(loc='upper left', bbox_to_anchor=(0.05, 1.05),
                   ncol=2, fancybox=True, shadow=True)
    save_plot_then_clear('q3ai')

    # # Task 3aii
    cos_matrix_angles = theta[:, None] - theta[None, :]
    cos_matrix = np.cos(cos_matrix_angles)
    lambda_val = 1.9
    tau_val = 1
    r_vector = np.zeros(theta.size)

    deriv_func = partial(calc_deriv, h_input, lambda_val, tau_val, cos_matrix, delta_theta)
    rate_storage, time_storage, final_r = run_euler_iterations(time_steps, delta_t, r_vector, deriv_func)
    plt.plot(theta, final_r, label='final firing rates')
    plt.xlabel('$\\theta$')
    plt.ylabel('$r(\\theta)$')
    save_plot_then_clear('q3aii')

    r_vector = np.zeros(theta.size)
    deriv_func = partial(calc_deriv_linear, h_input, 0.9, tau_val, cos_matrix, delta_theta)
    rate_storage, time_storage, final_r = run_euler_iterations(time_steps, delta_t, r_vector, deriv_func)
    plt.plot(theta, final_r, label='final firing rates')
    plt.xlabel('$\\theta$')
    plt.ylabel('$r(\\theta)$')
    save_plot_then_clear('q3aii_linear')




    # # Task 3bi
    g_vals = [-1, 0, 1]
    h_vector = {}
    for g in g_vals:
        h_vector[g] = g + 5 * np.exp(-2 * theta**2)
        plt.plot(theta, h_vector[g], label=str(g))
    plt.xlabel('$\\theta$')
    plt.ylabel('$h(\\theta)$')
    plt.legend(loc='upper left', bbox_to_anchor=(0.05, 1.05),
                   ncol=2, fancybox=True, shadow=True)
    save_plot_then_clear('q3bi')

    # # Task 3bii
    final_r_2 = {}
    for g in g_vals:
        r_vector = np.zeros(theta.size)
        deriv_func2 = partial(calc_deriv, h_vector[g], lambda_val, tau_val, cos_matrix, delta_theta)
        _, _, final_r_2[g] = run_euler_iterations(time_steps, delta_t, r_vector, deriv_func2)
        plt.plot(theta, final_r_2[g], label=str(g))
    plt.xlabel('$\\theta$')
    plt.ylabel('$r(\\theta)$')
    plt.legend(loc='upper left', bbox_to_anchor=(0.05, 1.05),
                   ncol=2, fancybox=True, shadow=True)
    save_plot_then_clear('q3bii')

    # # Task 3ci
    h_input_c = 5 * np.exp(-2* (theta-np.pi/2)**2) + 2.5 * np.exp(-2* (theta+np.pi/2)**2)
    plt.plot(theta, h_input_c)
    plt.xlabel('$\\theta$')
    plt.ylabel('$h(\\theta)$')
    save_plot_then_clear('q3ci')

    # # Task 3cii
    r_vector = np.zeros(theta.size)
    deriv_func3 = partial(calc_deriv, h_input_c, lambda_val, tau_val, cos_matrix, delta_theta)
    _, _, final_r_3 = run_euler_iterations(time_steps, delta_t, r_vector, deriv_func3)
    plt.plot(theta, final_r_3)
    plt.xlabel('$\\theta$')
    plt.ylabel('$r(\\theta)$')
    save_plot_then_clear('q3cii')

    # # Task 3ciii
    # Now let's make the h input 0:
    deriv_func4 = partial(calc_deriv, np.zeros(theta.size), lambda_val, tau_val, cos_matrix, delta_theta)
    _, _, final_r_4 = run_euler_iterations(int(0.01/delta_t), delta_t, final_r_3, deriv_func4) # continue for 10ms
    plt.plot(theta, final_r_4, label='10 ms')


    _, _, final_r_4 = run_euler_iterations(int(0.49/delta_t), delta_t, final_r_4, deriv_func4) # continue for 10ms
    plt.plot(theta, final_r_4, ':', label='500 ms')

    plt.legend(loc='upper left', bbox_to_anchor=(0.05, 1.05),
                   ncol=2, fancybox=True, shadow=True)

    plt.xlabel('$\\theta$')
    plt.ylabel('$r(\\theta)$')
    save_plot_then_clear('q3ciii')












