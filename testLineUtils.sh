#!/bin/bash
echo "==================================================================================="
echo "Updating everything..."
echo "==================================================================================="
sudo apt update && sudo apt upgrade -y
echo "==================================================================================="
echo "Installing package 'build-essential'..."
echo "==================================================================================="
sudo apt install build-essential -y
echo "==================================================================================="
echo "Installing package 'cmake'..."
echo "==================================================================================="
sudo apt install cmake -y
echo "==================================================================================="
echo "Installing package 'git'..."
echo "==================================================================================="
sudo apt install git -y
echo "==================================================================================="
command_output1=$(ls -l)

if [[ $command_output1 == *"lineutils"* ]]; then
  echo "'lineutils' found!"
  echo "==================================================================================="
else
  echo "'lineutils' not found! Cloning repo..."
  echo "==================================================================================="
  git clone https://gitlab.com/TheOmegaCarrot/lineutils.git > /dev/null
  echo "==================================================================================="
fi

echo "Entering 'lineutils'..."
cd lineutils
echo "==================================================================================="


command_output2=$(ls -l)
if [[ $command_output2 == *"build"* ]]; then
  echo "'build' folder found!"
  rm -rf build > /dev/null
  mkdir build > /dev/null
  echo "==================================================================================="
else
  echo "'build' folder not found! Creating folder..."
  mkdir build > /dev/null
  echo "==================================================================================="
fi


echo "Building 'lineutils'..."

cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${HOME}/.local
echo "==================================================================================="
echo "Build complete."
echo "==================================================================================="
echo "Entering build folder..."
cd build
echo "==================================================================================="

echo "Installing 'lineutils'..."
make -j4 && make install
echo "==================================================================================="
echo "Testing installation..."
echo "==================================================================================="

command_output3=$(seq 3 | wrap \')

verificationString=$(cat <<-END
        '1'
        '2'
        '3'
END
)

#echo "$verificationString"

if [[ $command_output3 == *"$verificationString"* ]]; then
  echo "'lineutils' test successful!"
  echo "'lineutils successfully installed!"
  echo "==================================================================================="
else
  echo "'lineutils' test failed!"
  echo "'lineutils' failed to install. Please try again."
  echo "==================================================================================="
fi

echo "Cleaning..."
cd ../../
rm -rf lineutils
echo "==================================================================================="
echo "Finished!"
echo "==================================================================================="
