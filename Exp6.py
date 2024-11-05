def fm_algorithm(stream):
    hash_values = []
    max_tail_length = 0

    for element in stream:
        hash_value = (3 * element + 1) % 32
        hash_values.append(hash_value)

        tail_length = 0
        while hash_value % 2 == 0:
            tail_length += 1
            hash_value >>= 1

        max_tail_length = max(max_tail_length, tail_length)

    estimate = 2 ** max_tail_length
    return estimate

stream = [4, 2, 5, 20, 1, 6, 3, 7]
estimate = fm_algorithm(stream)
print("Estimated distinct elements:", estimate)