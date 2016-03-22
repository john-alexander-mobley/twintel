:repeat
For %%G IN (tweet*.js) do (
 node %%G
 sleep 250s
)
goto repeat
