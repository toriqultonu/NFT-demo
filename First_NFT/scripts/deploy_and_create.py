from scripts.helpful_scripts import get_account, SimpleCollectable

sample_token_uri = (
    "ipfs://Qmd9MCGtdVz2miNumBHDbvj8bigSgTwnr4SbyH6DNnpWdt?filename=0-PUG.json"
)

OPENSEA_URL = "https://testnets.opensea.io/assets/{}/{}"


def main():
    account = get_account()

    simple_collectable = SimpleCollectable.deploy({"from": account})
    tx = simple_collectable.createCollectable(sample_token_uri, {"from": account})
    tx.wait(1)

    print(
        f"You can view your NFT at {OPENSEA_URL.format(simple_collectable.address, simple_collectable.tokenCounter() -1 )}"
    )
