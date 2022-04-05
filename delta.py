import os
import sys


def delta():
    length = int(sys.argv[1])
    full_set = []
    for number in range(0, length):
        full_set.append(number)

    print(find_interesting([], full_set))


def find_interesting(p_set, c_set):
    if len(c_set) == 1:
        if interesting(p_set + c_set):
            return c_set
        else:
            return []

    half = len(c_set) // 2
    if interesting(p_set + c_set[:half]):
        return find_interesting(p_set, c_set[:half])

    if interesting(p_set + c_set[half:]):
        return find_interesting(p_set, c_set[half:])

    new_p_set = p_set + c_set[half:]
    new_c_set = c_set[:half]

    new_p_set_2 = p_set + c_set[:half]
    new_c_set_2 = c_set[half:]

    return find_interesting(new_p_set, new_c_set) + find_interesting(new_p_set_2, new_c_set_2)


def interesting(c_set):
    command = ""
    param = " ".join([str(item) for item in c_set])
    for argv in range(2, len(sys.argv)):
        command += str(sys.argv[argv]) + " "
    exit_code = os.system(command + " " + param)
    return exit_code


if __name__ == '__main__':
    delta()
