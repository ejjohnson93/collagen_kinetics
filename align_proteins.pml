### PyMOL script to carry out structural alignment
# Will align proteins passed as command line arguments and save them to a new .pdb file with '_aligned' appended.
# The first arguments are the proteins you want to align (the mobile elements) and the last argument is the template (the stationary element)
## Example usage: 
# pymol align_proteins.pml -- heterotrimer_up_no_hydrogen_250ns.pdb homotrimer_up_no_hydrogen_250ns.pdb C2S_homotrimer_rotated_z.pdb
# where 'C2S_homotrimer_rotated_z.pdb' is the file the others are being aligned to 
# can also be used with -c flag to avoid opening PyMOL GUI e.g. 
# pymol -c align_proteins.pml -- heterotrimer_up_no_hydrogen_250ns.pdb homotrimer_up_no_hydrogen_250ns.pdb C2S_homotrimer_rotated_z.pdb

from pymol import cmd
import sys

# load in proteins
for i in sys.argv: cmd.load(i)

# Assign protein names to variable names then assign the mobile elements to the variable 'to_align' and the stationary element to 'template'
names = cmd.get_names("all")
to_align = names[:-1]
template = names[-1]

# Carry out alignment 
for x in to_align: cmd.cealign(template, x)

# Save outputs, the appended term can be modified
for x in to_align: cmd.save(x+'_aligned.pdb', x)






