## Copyright (C) 1995, 1996, 1997, 1998, 1999, 2000, 2003, 2004, 2005,
##               2006, 2007 John W. Eaton
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {} record (@var{sec}, @var{sampling_rate})
## Records @var{sec} seconds of audio input into the vector @var{x}.  The
## default value for @var{sampling_rate} is 8000 samples per second, or
## 8kHz.  The program waits until the user types @key{RET} and then
## immediately starts to record.
## @seealso{lin2mu, mu2lin, loadaudio, saveaudio, playaudio, setaudio}
## @end deftypefn

## Author: AW <Andreas.Weingessel@ci.tuwien.ac.at>
## Created: 19 September 1994
## Adapted-By: jwe
## And adapted again 11/25/2010 by Rob Frohne

function X = record (sec, sampling_rate)

  if (nargin == 1)
    sampling_rate = 8000;
  elseif (nargin != 2)
    print_usage ();
  endif

  file = tmpnam ();
  file= [file,".wav"];

  input ("Please hit ENTER and speak afterwards!\n", 1);

  cmd = sprintf ("rec -c1 -r%d %s trim 0 %d",
                   sampling_rate, file, sec)

  system (cmd);

  X = wavread(file);

endfunction
