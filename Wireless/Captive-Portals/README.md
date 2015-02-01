#[Basic Wireless Captive Portals]

greg.foss[at]owasp.org - 1/26/2015 - version 0.1 Beta

AppSec California Presentation Slides --> http://www.slideshare.net/heinzarelli/wifi-hotspot-attacks

-----

#[What]

This is a basic Wireless Captive Portal that is meant to be expanded upon based on the target use-case. I put this together to help folks out with deploying captive portals on various devices without having to go through the guess-work involved in configuring captive portals.

-----

#[How]

This project consists of two captive portal options. The first 'Fake-AP' is a basic landing page that can be deployed easily using <a href="https://github.com/silverfoxx/pwnstar/" target="_blank">PwnSTAR</a> or manually. The second folder 'Pineapple' is made for deploying a fake AP on a <a href="http://hakshop.myshopify.com/products/wifi-pineapple" target="_blank">Wi-Fi Pineapple</a>.

Depending on the use-case, all you need to do is take this template, create some basic CSS, add images, and voila you have a nice fake captive portal. The real trick here (especially when using the Pineapple is to build upon the already working splash pages and form processors). You can also take the key aspects of the code and apply them to a form processor that you already have depending on the deployment option.

-----

#[License]
Copyright (c) 2015, Greg Foss All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
Neither the name of Greg Foss nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.