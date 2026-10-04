# Verification

The flat repository is checked with MATLAB R2025b and Image Processing Toolbox using `verify_examples` followed by `run_demo`.

The assertion suite checks constant-image behaviour, impulse response, identical inputs, mismatched dimensions, RGB conversion, NaN, out-of-range floating-point input, and unsupported channel counts. The demo generates `brain-difference-result.png` and `moon-sharpening-result.png` from the supplied coursework inputs.

No disease classifier, diagnostic benchmark, or CPN/PHP test is part of this repository. The generated figures illustrate pixel operations only.
