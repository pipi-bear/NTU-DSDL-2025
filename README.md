:bangbang: **IMPORTANT: My HW are not 100% correct, check the "Grades and Feedback" section in the end of this README for more details!**

# Content in this repo

This repo contains the HW (including labs) for the courese "Digital systems design and lab (2025 Spring)", conducted by Prof. Chung-Wei, Lin @ NTU CSIE.

For each `HW*` subdirectory, you could find:

- `HW-0*.pdf`: Homework spec
- `DSDL_HW*.pdf`: The pdf file that I turned in.
- `DSDL_HW*.tex`: The latex file corresponding to the pdf file
> :bulb: Check this .tex file if you have no idea how the tables, circuits... shown in the pdf file could be drawn.

## Labs

For the two labs in this course, you could find them at:
- `HW3/LAB-01`
- `HW4/LAB-02`

Both the subdirectories `LAB-01` and `LAB-02` contains the spec `LAB-0*.pdf` and my finished code.

## Additional info: README in HW 

For HW3 and HW4, I wrote `HW*_README.md`, which you could find in the corresponding HW subdirectory.
The content written in these files are briefly explained below:

- `HW3_README.md`: 
    - Originally I thought that GTKWave could not be used in MacOS, so I use another application named "Surfer" to view the waveform. (This is actually solved when I was writing LAB-02, and the solution is written in `HW4_README.md`) I recorded the details of the problem that I encountered during installation, so if you're also using Mac and have problem installing GTKWave, maybe this would be useful.
    - I wrote brief explanation for how the implementation of the module `rca_gl` in `adders.v` was done, however, I did not do the same thing for `cla_gl`, since I'm too lazy :laughing:
- `HW4_README.md`: 
    - Detailed explanation for how to use the `karnaugh-map` package in latex to draw a beautiful K-map :cherry_blossom:
    - How I define `\tikzset{}` to use draw finite state machine in latex
    - Solution for failing to install GTKWave on Mac

## Notes

In `Notes/Lecture_slides_with_notes`, you could find the lecture slides with my notes.
The notes are really detailed, so I think that even though you do not have time to watch the lecture videos, you could still understand them.

However, my handwriting is really poor, so if you cannot distinguish anything in the notes, feel free to ask in issues.

# Grades and Feedback

- HW1: 52/60
- HW2: 56/60
- HW3 + Lab1: 88/90
- HW4 + Lab2: 82/90

I downloaded the files for grading details provided by the TA, but not all of them have comments mentioning the reason why the points are deducted, some of them only mentioned in which problems did the error occurred.

For the files that:
- we could only know which problems are wrong $\Rightarrow$ the files are named as `HW*_grade.pdf`
- contain brief explanations pointing out the reason for error deduction $\Rightarrow$ the files are named as `HW*_with_feedback.pdf`

These files can be found under each HW subdirectory.