"""Performs task 1"""
__author__ = 'eng-188do'
__date__ = '18/03/15'

import numpy as np
import matplotlib.pyplot as plt
import math
from IPython import embed


def save_plot_then_clear(name):
    fig = plt.gcf()
    fig.set_size_inches(8, 8)
    fig.savefig(name, dpi=100)
    fig.clf()

def run_euler_iteration(delta_t, final_t, nNeurons, i_val, f_vector, r_vector, w_matrix):
    firing_rate_storage = np.empty((nNeurons + 1, math.floor(final_t / delta_t)+1))  # first row time, others are firing rates
                                                                # for each neuron.

    time = 0  # initial time
    i = 0  # iterator to go through times

    while time <= final_t:  # iterate through time steps
        firing_rate_storage[:, i] = np.insert(r_vector, 0, time)  # put in the previous data
        time += delta_t  # update time
        dr_by_dt = -r_vector + f_vector * i_val + np.dot(w_matrix, r_vector) # find the derivative information
        r_vector += delta_t * dr_by_dt  # update the firing rate
        i += 1  #update the index iterator

    return firing_rate_storage



if __name__ == '__main__':
    base_plot_name = "task2_2_time125"
    rng = np.random.RandomState(10)  # random number generator
    delta_t = 0.001  # time step
    final_t = 125  # final time point
    nNeurons = 10  # number of neurons
    i_val = 1  # the value for I
    f_vector = rng.randn(nNeurons)  # F vector
    g = 0.95
    rng = np.random.RandomState(30)  # reset rng so next is different each time
    w_matrix = rng.randn(nNeurons, nNeurons) * g/np.sqrt(nNeurons)
    r_vector = np.zeros(nNeurons)  # initial rates
    print(f_vector)
    print(w_matrix)
    np.savetxt("w_matrix.csv", w_matrix, delimiter=' & ', fmt='%.3f', newline=' \\\\\n')


    # run the simulations:
    firing_rate_storage = run_euler_iteration(delta_t, final_t, nNeurons, i_val, f_vector, r_vector, w_matrix)


    #a. Now plot the firing rates as a func of time:
    for i in range(nNeurons):  # plot each firing rate
        set_string = '--' if i > 4 else '-'
        plt.plot(firing_rate_storage[0, :-2], firing_rate_storage[i + 1, :-2], set_string, label='Neuron ' + str(i + 1))

    # Set up axis and legend, size and save it to correct place
    plt.xlabel('Time (secs)')
    plt.ylabel('Neuron Firing Rate')
    plt.legend(loc='upper left', bbox_to_anchor=(0.05, 1.05),
               ncol=3, fancybox=True, shadow=True)
    save_plot_then_clear(base_plot_name + '_a')

    time_index = np.linspace(0, final_t, 10000)
    plt.plot(firing_rate_storage[0, :-2], firing_rate_storage[1, :-2], label='Neuron 1' )
    plt.plot(time_index, np.sin(0.37853796*time_index),':', label='Predicted oscillations')
    plt.plot(time_index, np.exp(-time_index*0.053542639999999975),':', label='Predicted decay')
    plt.xlabel('Time (secs)')
    plt.ylabel('Neuron Firing Rate')

    plt.legend(loc='upper left', bbox_to_anchor=(0.05, 1.05),
               ncol=2, fancybox=True, shadow=True)
    save_plot_then_clear(base_plot_name + '_a_2')

    #b. now plot the argand of the eigenvalues
    eigenvalues, eigenvectors = np.linalg.eig(w_matrix)
    plt.plot(eigenvalues.real, eigenvalues.imag, 'x', markersize=10, markeredgewidth=2.5)
    plt.xlabel('real value')
    plt.ylabel('imaginary value')
    plt.title('Eigenvalues of W matrix')
    #plt.show()
    save_plot_then_clear(base_plot_name + '_b')


    #c. now find the infinite rates and plot against ones after num of seconds
    r_inf = np.dot(np.linalg.inv( np.identity(nNeurons)-w_matrix), f_vector)*i_val

    x = np.arange(np.min(r_inf), np.max(r_inf), 0.01)
    plt.plot(x,x,color='#C2C2C2')

    plt.plot(r_inf, firing_rate_storage[1:, -2], 'x', markersize=10, markeredgewidth=2.5)
    plt.ylabel('r(t='+ str(final_t) +')')
    plt.xlabel('r$_{\\text{inf}}$')
    save_plot_then_clear(base_plot_name + '_c')









