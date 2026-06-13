Run `nixos-precommit` and fix every warning or error in a loop until the command exits clean.

## Loop

1. Run `nixos-precommit` via Bash and capture the full output.
2. If it exits 0 with no warnings, report success and stop.
3. Parse output and fix every issue found (see guidelines below).
4. Go back to step 1.

Do not stop mid-loop to ask for confirmation. Fix everything, then re-run. Only stop when clean or when you've tried the same fix twice with no progress (in which case, report the blocker).

## Fix guidelines

**statix — repeated keys** (`Avoid repeated keys in attribute sets`): merge the repeated top-level assignments into a single block.
```nix
# before
boot.initrd.availableKernelModules = [ ... ];
boot.initrd.kernelModules = [ ... ];
boot.kernelModules = [ ... ];

# after
boot = {
  initrd.availableKernelModules = [ ... ];
  initrd.kernelModules = [ ... ];
  kernelModules = [ ... ];
};
```

**statix — other warnings**: follow the suggestion printed in the statix output. It always includes a concrete fix.

**deadnix — unused binding**: remove the unused variable or import it flags.

**nix build — `warning:` lines**: the warning text usually names the deprecated option and its replacement. Find it in the relevant `.nix` file and apply the rename or syntax change.

**nixfmt**: the formatter runs in-place automatically — no manual fix needed. If it changed files, just continue the loop.

After each fix, verify the edit looks correct before re-running.
