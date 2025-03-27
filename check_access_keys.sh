#!/bin/bash

# Path to your user list file (one username per line)

read -p "What profile do you want to use?: " profile

user_list="users.lst"

# Iterate through each line in the file
while IFS= read -r user; do
  echo "Checking access keys for user: $user"
  aws iam list-access-keys --user-name "$user" --profile $profile
  echo "----------------------------------------"
done < "$user_list"
