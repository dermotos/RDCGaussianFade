RDCGaussianFade
===============

A UIView category that adds focus/defocus animation effects to any UIView. Works great on text layers and should be in keeping with iOS7 and above in terms of styling.

## Features

- UIView category
- FadeIn effect gives the impression of the view being a blur, then sharpening and coming into focus
- FadeOut effect gives impressions of a UIView going out of focus before fading out
- Both methods accept an animation time
- Optional completion handler blocks
- Includes checks to ensure target view is correctly setup (correct alpha value) before animating.
- Also checks to ensure method is called on correct thread.

## How To Use

1. Add UIView+RDCGaussianFade.h & UIView+RDCGaussianFade.m to your project.
2. Ensure your project links with CoreImage, QuartzCore and CoreGraphics frameworks
3. Add `#import UIView+RDCGaussianFade.h` to the import statements in your class
4. Ensure before fading in a view, that you set its alpha to 0.0 first.
5. Ensure before fading out a view, that you set its alpha to 1.0 first.
5. Call fadeIn: or fadeOut: on any UIView or subclass (eg: UILabel works great!)




```
[self.settingsButton setAlpha:0];
// 1 second fadeIn animation
[self.settingsButton fadeIn:1.0 withCompletion:^{
      NSLog(@"Fade animation completed");
                }];
                

[self.settingsButton setAlpha:0];
// 3 second fadeOut animation
[self.settingsButton fadeOut:3.0 withCompletion:^{
      NSLog(@"Fade animation completed");
                }];

```


## Requirements

- iOS 6.0 (may work with iOS 5, but hasn't been tested)
- ARC
- QuartzCore, CoreGraphics & CoreImage frameworks in your project
- Attribution isn't required, but would be nice.



## Contact

Dermot O Sullivan

[@dermotos](https://twitter.com/dermotos)

## License

RDCGaussianFade is released under an MIT license.

Copyright (c) 2013 Rocky Desk Creations

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


