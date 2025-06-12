# LAB01

I'm using macOS Sequoia 15.0.1. 

## Install 

### icarus-verilog

icarus-verilog could be successfully installed via brew:

`brew install icarus-verilog`

### GTKWave

For GTKWave, the brew command:

`brew install --HEAD randomplum/gtkwave/gtkwave`

would cause some error on new versions of MacOS, the following are the things that I tried, but eventually I found that now GTKWave does not support newer versions of MacOS, therefore, instead of using docker, **I gave up using GTKWave and changed to use Surfer**.

I installed the following tap:

`brew install yanjiew1/gtkwave/gtkwave`

but still got the following error when executing the command `gtkwave`:

```
Can't locate Switch.pm in @INC (you may need to install the Switch module) (@INC contains: /Library/Perl/5.34/darwin-thread-multi-2level /Library/Perl/5.34 /Network/Library/Perl/5.34/darwin-thread-multi-2level /Network/Library/Perl/5.34 /Library/Perl/Updates/5.34.1 /System/Library/Perl/5.34/darwin-thread-multi-2level /System/Library/Perl/5.34 /System/Library/Perl/Extras/5.34/darwin-thread-multi-2level /System/Library/Perl/Extras/5.34) at /opt/homebrew/bin/gtkwave line 2.
BEGIN failed--compilation aborted at /opt/homebrew/bin/gtkwave line 2.
```

So I first installed "cpanminus" and then use it to install the Perl module "Switch" using the following commands:

```
brew install cpanminus
sudo cpanm Switch
```

Also, the output of the tap informed us to update xcode, I updated to v16.2, but it still doesn't work, and found that other people are encountering the same issue.

So if you are using Mac and wanted to use GTKWave, maybe you should check if there's any update for the tap first.

### Surfer

Download Sufer at [this page](https://surfer-project.org), or in this page, there's a link to view waveform in the browser.

## Explanation for the code

### adders.v

In this file, we need to modify two modules:

1. `rca_gl`: 3-bit ripple carry adder
> As in p.31 (Can be found in the file `LAB-01.pdf`)
2. `cla_gl`: 3-bit carry lookahead adder
> As in p.32

#### rca_gl

From p.31, we can see that there's 3 full adders, so we can use the module `FA` to implement each of them. We can see that FA is defined like this:

`module FA(output CO, S, input A, B, CI);`

So we use the following line to construct the rightmost adder (the adder for the LSB bit 0):

`FA fa_0(C1, S[0], A[0], B[0], C0);`

This line means that:

We define a FA (full adder) named fa_0, it will create outputs:

- `C1`: the carry-in that would be carried to the next adder in the middle
> For example, if:
>
> A[0] = 1, B[0] = 1, C0 = 0  
> $\rightarrow$ then A[0] + B[0] + C0 would result in S[0] = 0, and C1 = 1.
- `S[0]`: the result of the sum for bit 0

And these outputs are calculated using the inputs:
- `A[0]`: the 0-th bit for the input A
- `B[0]`: the 0-th bit for the input B
- `C0`: the carry-in to this adder

Things are similar for the other two adders.

#### cla_gl



## Tips

- Can install the verilog highlight extension in vscode.



