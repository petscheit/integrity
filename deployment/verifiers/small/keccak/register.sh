echo -n "FactRegistry address: "
read FACT_REGISTRY

echo -n "Verifier address: "
read VERIFIER

sncast \
    invoke \
    --fee-token eth \
    --contract-address $FACT_REGISTRY \
    --function "register_verifier" \
    --calldata "0x736d616c6c 0x6b656363616b $VERIFIER"