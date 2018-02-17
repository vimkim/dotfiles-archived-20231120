# how to open a pdf with a specific page. not used quite often anymore.
alias skimpage="osascript ~/runtime_config/mac/skim/pdfpage.scpt"
alias skimp="osascript ~/runtime_config/mac/skim/pdfpage.scpt"

#####
alias hw='skimp ~/Downloads/hs-homework.pdf 1'

# econ
econdir=~/books/econ

## econometrics
alias econometricsdir='cl ~/books/econ/econometrics'

## dummies
alias econometrics_dummie='open ~/books/econ/econometrics/dummies/dummies.pdf'
alias dummie='econometrics_dummie'

##### Ben Lambert videos
alias econometrics_videos='open -a "/Applications/Google Chrome.app" "https://www.youtube.com/watch?v=M_5SLG7sUa0&index=1&list=PLwJRxp3blEvZyQBTTOMFRP_TDaSdly3gU"'
alias econometrics_videos_list='oac "https://www.youtube.com/playlist?list=PLwJRxp3blEvZyQBTTOMFRP_TDaSdly3gU"'
alias econometrics_progress='https://www.youtube.com/watch?v=Hi5EJnBHFB4&list=PLwJRxp3blEvZyQBTTOMFRP_TDaSdly3gU&index=15'
alias progress='econometrics_progress'

alias econometrics_videos_asymptotic='oac "https://www.youtube.com/playlist?list=PLwJRxp3blEvZBAn3bwAAtdJqotRPBWBlP"'
alias econometrics_videos_asymptotic_progress='oac "https://www.youtube.com/watch?v=4QAeBJVn9WI&list=PLwJRxp3blEvZBAn3bwAAtdJqotRPBWBlP&index=8"'

### stock book
stockdir=~/books/econ/econometrics/stock
alias stock='open $stockdir/stock3rdUpdate.pdf'
alias stockNoUpdate='open $stockdir/stock_intro_3rd.pdf'
alias stockSolution='open $stockdir/solution.pdf'

# comp
compdir=~/books/comp
## langauges
alias tcpl="skimp ~/Google\ Drive/books/comp/TCPL-c89.pdf 1"

## functional
alias clojure="skimp ~/Google\ Drive/books/comp/clojure-for-the-brave-and-true.pdf 1"
alias lol="skimp ~/Google\ Drive/books/comp/lisp-family/land-of-lisp.pdf 30"

## compiler + assemply
alias compiler='skimp ~/books/comp/compiler/aho.pdf 40'
alias assem="skimp ~/Google\ Drive/books/comp/assembly-language-step-by-step_new.pdf 90"

## bibles
alias csapp="open ~/Google\ Drive/books/comp/bibles/csapp/csapp-bryant-2nd.pdf"
alias csappdir="cl ~/Documents/books/csapp/"
alias sicp="skimp ~/Google\ Drive/books/comp/lisp-family/sicp.pdf 1"
alias sicp_easy="open ~/books/comp/bibles/sicp/sicp_easyread.pdf"
alias sicp_playlist='open -a "/Applications/Google Chrome.app" "https://www.youtube.com/playlist?list=PLE18841CABEA24090"'
alias sicp_videos='open -a "/Applications/Google Chrome.app" "https://www.youtube.com/watch?v=2Op3QLzMgSY&index=1&list=PLE18841CABEA24090"'
