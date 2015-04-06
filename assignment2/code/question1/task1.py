"""Performs task 1"""
__author__ = 'eng-188do'
__date__ = '18/03/15'

import numpy as np
import matplotlib.pyplot as plt
import math
from IPython import embed


def run_euler_iteration(delta_t, final_t, nNeurons, lambda_val, i_val, f_vector, r_vector):
    firing_rate_storage = np.empty((nNeurons + 1, math.floor(final_t / delta_t)+1))  # first row time, others are firing rates
                                                                # for each neuron.

    time = 0  # initial time
    i = 0  # iterator to go through times

    while time <= final_t:  # iterate through time steps
        firing_rate_storage[:, i] = np.insert(r_vector, 0, time)  # put in the previous data
        time += delta_t  # update time
        dr_by_dt = -r_vector * lambda_val + f_vector * i_val  # find the derivate information
        r_vector += delta_t * dr_by_dt  # update the firing rate
        i += 1  #update the index iterator

    return firing_rate_storage



if __name__ == '__main__':
    rng = np.random.RandomState(10)  # random number generator
    delta_t = 0.001  # time step
    final_t = 2  # final time point
    nNeurons = 10  # number of neurons
    lambda_val = -1  # value for lambda
    i_val = 1  # the value for I
    f_vector = rng.randn(nNeurons)  # F vector
    r_vector = np.zeros(nNeurons)  # initial rates
    print(f_vector)


    # embed()

    firing_rate_storage = run_euler_iteration(delta_t, final_t, nNeurons, lambda_val, i_val, f_vector, r_vector)

    for i in range(nNeurons):  # plot each firing rate
        set_string = '--' if i > 4 else '-'
        plt.plot(firing_rate_storage[0, :], firing_rate_storage[i + 1, :], set_string, label='Neuron ' + str(i + 1))

    # Set up axis and legend, size and save it to correct place
    plt.xlabel('Time (secs)')
    plt.ylabel('Neuron Firing Rate')
    plt.legend(loc='upper left', bbox_to_anchor=(0.05, 1.05),
               ncol=3, fancybox=True, shadow=True)

    fig = plt.gcf()
    #fig.set_size_inches(18.5, 10.5)
    fig.set_size_inches(14, 8)
    #plt.show()
    fig.savefig('qc_2.png', dpi=100)


