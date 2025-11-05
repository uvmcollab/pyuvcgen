-i ${{ name | upper }}_ROOT/rtl
-i ${{ name | upper }}_ROOT/env
-i ${{ name | upper }}_ROOT/tests
-i ${{ name | upper }}_ROOT/tb
${{ name | upper }}_ROOT/env/top_env_pkg.sv
${{ name | upper }}_ROOT/tests/top_test_pkg.sv
${{ name | upper }}_ROOT/tb/tb.sv
