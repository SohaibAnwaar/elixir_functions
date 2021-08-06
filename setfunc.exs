"""
Functions Included
@ Genearte Power set
@ Set comparing
  1. Subset of a set
  2. Superset of a set
  3. Equals to set


"""



defmodule Setfunc do
  @moduledoc """
  This module helps you to calculate the power set of a set

  Make Powerset like this

    list1 = [1,2,3,4]
    powerset_list1 = Setfunc.powerset([1,2,3,4,5])

  """

  def powerset(list) do

    # Getting the length of a set
    n = length(list)

    # Taking the square of number
    max = round(:math.pow(2,n))

    # Getting the powerset of a set in binary
    binary_set = powerset1(max-1 ,n , [])

    # Converting binary list to original List
    string_power_set = convert_binary_to_string(list, binary_set, [])

    # Returning power set
    string_power_set
  end

  defp convert_binary_to_string(list, [head| tail], results) when byte_size(head) == length(list) do

    # Converting binary to list i.e list =[1,2,3,4,5]-->calculate binary  ["00000" .... "11111"] -> [[] ... [1,2,3,4,5]]
    word_conversion = binary_word_to_original(head |> String.codepoints , list, [])

    # adding results to the previous list
    results = results ++ [word_conversion]

    # Recursion
    convert_binary_to_string(list, tail,  results)
  end

  # End of the binary_to_string_func
  defp convert_binary_to_string(list, binary, results)do
    results
  end

  # Converting Single "11111" -> [1,2,3,4,5]
  defp binary_word_to_original([head | tail], original_list, results) when byte_size(head) > 0 do

    # Getting if their is 1 on that index of string than replace it with the list index
    value = cond do
      head == "1" -> [Enum.at(original_list,(length(original_list) - length(tail)) - 1 )]
      true -> []
    end

    # Adding results to the previous string
    results = results ++ value

    # Recursion
    binary_word_to_original(tail, original_list, results)

  end

  # Stoping recursion
  defp binary_word_to_original(list, original_list, results) do
    results
  end

  # Calculating binary for powerset
  defp powerset1(n, max_length, binary_results) when n >= 0 do

    # Getting the binary of digit upto max length
    binary = Integer.digits(n, 2) |> Enum.join()

    # Calculating zeros according by taking difference from the max
    # length of string
    add_zeros = max_length - String.length(binary)

    # Adding zeros
    binary_results = binary_results ++ [String.duplicate("0", add_zeros) <> binary]

    # Recursion
    powerset1(n - 1 ,max_length,  binary_results)
  end

  # Stoping recursion
  defp powerset1(n,max_length ,binary_results) do
    binary_results
  end
end


defmodule SetCompare do
  @moduledoc """

  This module helps you to find if the list is

  1. Superset of list
  2. Superlist of list
  3. Equals to the list

  Use Comparision Module Like this

    \tSetCompare.compare([1,2,3,4,5], [1,2,3])\n
    \tSetCompare.compare([1,2,3], [1,2,3,4,5])\n
    \tSetCompare.compare([1,2,3,4,5], [1,2,3,4,5])
  """

  def compare(list1, list2) do
    # Getting powerset of list 1
    powerset_list1 = Setfunc.powerset(list1)

    # Getting powerset of list 2
    powerset_list2 = Setfunc.powerset(list2)

    # Deceding results
    value = cond do
      list1 == list2 -> "Both Lists are equal"
      list1 in powerset_list2 -> "A is subset of B"
      list2 in powerset_list1 -> "A is superlist of B"
      true -> "A not in B\nB not in A\n A not equals to B"
    end
    IO.puts("\n\n\n#{value}")
  end

end



"""
Uncomment this tho test
SetCompare.compare([1,2,3,4,5], [1,2,3])
SetCompare.compare([1,2,3], [1,2,3,4,5])
SetCompare.compare([1,2,3,4,5], [1,2,3,4,5])




powerset_list1 = Setfunc.powerset([1,2,3,4,5])
IO.inspect(powerset_list1)
"""
