use cairo_verifier::{
    stark::StarkCommitment,
    table_commitment::table_commitment::{TableCommitmentConfig, TableCommitment},
    vector_commitment::vector_commitment::{VectorCommitmentConfig, VectorCommitment},
    tests::stone_proof_fibonacci_keccak,
};

fn get() -> StarkCommitment {
    return StarkCommitment {
        traces: stone_proof_fibonacci_keccak::traces::commitment::get(),
        composition: TableCommitment {
            config: TableCommitmentConfig {
                n_columns: 0x2,
                vector: VectorCommitmentConfig {
                    height: 0x16, n_verifier_friendly_commitment_layers: 0x64,
                },
            },
            vector_commitment: VectorCommitment {
                config: VectorCommitmentConfig {
                    height: 0x16, n_verifier_friendly_commitment_layers: 0x64,
                },
                commitment_hash: 0x671e750eb2c87f39263a909ab58b1ae4175bdff34dde999c02ca360490bb1e8,
            },
        },
        interaction_after_composition: 0x66e527678ac61b27330fd77590774f214bcadea25b3e6a9e9d2bcbd2bd58acb,
        oods_values: stone_proof_fibonacci_keccak::stark::oods_values::get().span(),
        interaction_after_oods: array![
            0x1,
            0xeb24355844f3985b14be3b60d49120d33460a2c8a8ce0b03dffc3cca11f99d,
            0x5ca2b7ade7d69509e31e99c5e945d4fe84529614e2f9ee71e57780d051b8a0f,
            0x5c066d0915666ae4f61ba510d6d5c1ca15cb72edd7eee3840a1dd9f55df7f99,
            0x171a8b8965efd5af8a5efcf211bfb29cf80df95445331f7d33a89e595ca793a,
            0xb93e796a7a088b449c3665f6e9a43919a0807a8c54f07b5b3fd062bff6a69c,
            0xd13587fee56b8a8b3c03325a84319f5c47d5282ad47d8bf66450a26715c3e7,
            0x78f9f64fd0b66504a1486a7c3fbee93cad4db70b24e2423526c2bca2ccdc40a,
            0x29bffee57ff868ecf1e427fe8626a2152876c841f887ea5d845c2b68df3a0f4,
            0x39e485b5d70bf3e5a18a6700246516f474df3cc452550d8a5395fd2ff51e2c5,
            0x7dff5926042b37aa8dfb1ba85bd46a8aed7479b1385af4c9bddb5577fd78173,
            0x79abee9f231ebeb7fad7301dba6dece66b31b89d92b7fe915c401b5f79ae941,
            0x7dc9a70f5f15679612b1ab9fc877f5760e4b337b732c4336a828da9cbb3869f,
            0x35eb6bb78f373b80e31112d77b86e3f8463b7fb32ae1ec80667b92de87c453f,
            0x27af0c002241a0b2e3100f10a74588d1a129e6237acaef6d3fa12ac80338f6f,
            0x7423857cfd058e671336d9376f67516f4fe3c6e1f345ed834bbc4357b10140f,
            0x36100d0d42c50f5a4f42cb8d5fa07b2863dd574bb95ce92ae84e897f6e4cc39,
            0x18779d2d7fc40fb6ab8335cbd3abad527a41043102312aa69f65881e2530604,
            0x7a9ceafe786a08ef5120f3b0484175d5ee492b5abb90e6ddb6842c75ae4a503,
            0xc63038aee8a68d07501da667f0757cdc12b5fa1cca0356e650961e6cb34521,
            0x2f79d496985b9f181040fd5371a88a61c9b25108ab4422ebc43196d64dfb4a4,
            0x53f683a7f8e1d38dae29f9693caf32888fc8930f09e647eb4f4faa6c572d15c,
            0x31e349fbe50c53ce379c5483b5429b23071348940548f4dd1e027824b7ae942,
            0x242680245cac3ef11c66553b64ddd7c0c32f9f1fe19607e8847823b09d624d9,
            0x40fd70719a05167f9a617190fd609904819af06761a55af410d9362e6f45bc9,
            0x43e49f9e059ccabd8f9a2cdc6a445f5c45d4bd68b303831a12c3ca5b028acc4,
            0x52e09a64d7bb0122730a6c302b9a8f69fe0a9b4adc14beb5a06c311aa0aa0c0,
            0x1500a01a8b16aaacc57a9fbdf0917f1f265648c243aad828922a098a00eec21,
            0x4a70691d68dec1d6a69ecef3d727f7934a623066e38d6bc4f0f886eea8d6b0b,
            0xf3b0e71c5fe8f2e2cff759ce4b4c1ea0efaf9664b51aff8776d5cd2ae98af2,
            0x16781712a0685730a2078969a5cf054742fa27f71b533b5e9cb1955c6f3921b,
            0x521a146c44e12d14676e5c7f0e5562a7a753cda31969afb517dd4bb12b7cc10,
            0x414a2ea391edc0a62ab87552318048e11a11f1144b9de553ed3ef21395fc1f0,
            0x331d3e4d7b618584bdf1c970fe3755cf048004bca065ee0f4ba451a9ecdbbd2,
            0xbe3de01d1727db8082d4f7c4292a086079f9d384ad12764be6671939da4d24,
            0x71a7e6f7e1a6e4a0b4b46e738f57a3813f29c8960ea4b7532cd3e579fe8cfb3,
            0x74061aa42a79d23b6cf210612da821963614d5fa11b8bd137058020822a529b,
            0x7f0743b0c74c4db5e61620825ab364c0f2e0acee8cfdff87b22c10016725e90,
            0x7facb99451acf877b282859265c02da7f69b9ee42464ace4944f77a854b478f,
            0x16016b4fad63c7732e89b035200505d1ffe750830b4cf97eeefd3db07a470f,
            0x5c782dd81b54d30536bf49a1cf556b0f262a061da88dcd0559d47556dbd3f70,
            0x27d196403a55a67a2c216d6cd64aaee874a838fd96372c260427ea103d2015d,
            0x1594e108a810be9b78b5f21d3bf9ea01421f73c459b4ec7402c48c108d851be,
            0x5eeacf367ff8c901a5a861b43dd6ec434a819dbca77bb91998263c981ababd,
            0x375a70cb838e3bfab15a8a46cbf52931d425fac9e2eed65ee53b177cb176470,
            0x2373ba4a029166363d4bc94103455311a7ca7ebc0a220c4a2a2c447fc06db3a,
            0x77780250c9de2bd0235931232b05cd97f758bab37a12a84bdcd0ad1dbf56520,
            0x25ecbfb4758c15bcdd87982138955ca6f1260684f5a7bc6dc32c20ee3a971e8,
            0x69001b5dac1aeb524c576fe9940d15a9a16c55401ddef3286cdf27b06e88b21,
            0x5d1eec231d434921c1f796c187a59254f8e59859064b3e55fd33ac3154ff2ce,
            0x7720b7aa44f7d2724276216d7b29b0d0979a0503c0333f65f1c87072d5ab25f,
            0xfd2bb9c83fbcde3ff45551753971509a8f15f26a61067a29dba2e01868f2c6,
            0x43aaf9629c31628c8a50a830105a4f0731c51489702ca4cdf163fa16f83b567,
            0x946c9c1d6bda59dfba4d4b680c191c1fc16b2009a0b4623385346a8fb08f73,
            0x71358fcd69944e9442752b2fa91ab6d9962e91007777587e150639c089bd142,
            0x5f633314cdba4c4a915a2bc63cf35e94479804297e6f0a3ffc0d94be766225c,
            0xf519e32abd1abb968657e55b12562ca6c088315ca4f61ded53c2fcb24a51b9,
            0x32bbdb79230c957c52c2aa3f56a1a466a84ca2c9d7198800880b554ed4e637,
            0x6afe9aadbc83e9a6442b9f82e0d97f0b3f45b339a80ae62c6fda68b97f5495d,
            0x461f0830bfd40ef2b740d1e4740663d92abce2ed480bf34a1e914401c9a223f,
            0x274a9d52e693f1c05f01cc9d861fa5b4536f053536eb83c394de242ddec5205,
            0x58c14214902a78f30b96f80a6b502692870c542bbe196f7c72848b2e42450b5,
            0x120c3906ff3b5b742fa4bea7358135f93f1b4f21670335487d9656d0b86c78c,
            0x3e2877e2e18b7b8a5cb6e55c0e3f5bb01f5347b439ae9615566d075686cdf85,
            0x66e378b3f94b1c03ebd07e70f54525805a33bff8811ded225550fc881a5d28f,
            0x78644104cec6be621d4da13be0bdf7c60fbbba89358d468d564050c9f9596c,
            0x51a1a66cf71ea40147f270f8fcbdf3ad777847895777d497b3ce29d0b02ea76,
            0x14ad36d68beacb9de49494280712955066d8e443ed86c3e2706d4274504f316,
            0xd4ea2909442a70b015b1040b0735e60ed806cd85057343f8f0b174c589da8a,
            0x2c742a1b7876ecb2f1215c4704a4a81b13e8d67d06aa70f749101c12a1772a4,
            0x12fbd9c712dc49f38efc63ae3962ab2bcadca80c4f4919318595f9900e373a6,
            0x5537804489cf2c3915b88dc9649779afa97a36ba363084f0d7c97571e5a9063,
            0x15f13da785fc85c06a9b03869b3d4f3975a2e59c68c2c9fc3a68948c5f519f6,
            0x344fd83c7e776f819ba3a38699cc1e12349251eacef09deb40f9b8e845675ea,
            0x52c9499eb0bf56ab32418d55eb7f6bfe59bf8555d3cdc6fb70570941ead136e,
            0x6ae7c6008f70876516feec519ffd57a6c476d46ae10da2e8b7ea7c0042b7691,
            0x54e2253ffbf92d90a8281de552a4d0ed04c2e4c17c1a9a1bf77388c8f5b96f4,
            0x7370dfa37c3e3607c7c6df72fbac249ef68b77924dadf5ba7f816e301328053,
            0x34b76025f9f60666181e5b9d170852f040edbf94848f8c0e217682eb8e1638b,
            0x134298da0a8f0effc6289ace86c7d845016e199ab35706934102ad07d048511,
            0x5d2be6a32c128edd7cc0eab4fad73f23641e6abaec2f0ac56ef5a4ead6dc988,
            0x3e464096e1f318fb2b3c36ff768bcc59a212257cab8ce6ef4aaacb8be2bd2ac,
            0xebd193673b87a921b50fbac67e13d5d0cfe907d99a6813b45bdbff8b0f0df2,
            0x3fe925de3bb16d3e3c552ceae346b3a473510155cdfbe6bbf92f054b1441848,
            0x77dafd3a37d8614ece8ec217096407c3b7002debee5653298320fbe2063c017,
            0x6c51df2c75a93cc256b567074bccbf81bef02a9603b643a32298ca4dc82b5c2,
            0x31e80c74ac6d83919b3de981b6d4ff9e2359b4c09843c589bb9c9816c2d63f9,
            0x422b191cd898cb6839cd83114fc787d02d3f65a607c7de58a64d57987e33474,
            0x539cd917dde9eeae57e2b501369aa2cab0ff9f11796ff7eec84bcd93505a64a,
            0x5b789266eb924e328e35271b53547716fc6af0a422eb15415d8c1745a662319,
            0x18dd60b2ee4995945a30957dba5c8eb94528501964490ec7aef90ad5d4590e,
            0x28e9e5957e337dce3c8a3eed8a9415dceb341690fcb1bcc72f15f5e34867f05,
            0x753c8482837ebdb8759d4260a1dafa8b7859f7d95305f26e2ff0a14952441e8,
            0x66ea361a89f05b8cdced058d8253450e7f072581b5b2561b6aaa26fbbca7d42,
            0x2cbe699199702a26cec337e92fdc326642a274e61a386cda1fa0834aaad85e0,
            0x143c110602f3e62ab471a144510f2b70af55286681b4118f400741b5833f3ed,
            0x390a77aa6d8b0004645a68a09e8c839ac2947f100f885a2eb89fd43f0320516,
            0x410a64f4ebfd87c1ed88dbaa2044c4a0d6685781b6b53c99995fa57d2e2eebc,
            0x4aec731d87bb1677f2d541d82f40a2a423e108cd7543e9193dd6650277e319b,
            0x6de570ca7f2908a6a35f037fecad7cbdda778daaea8077bc0475111c062a86f,
            0x2a387eec937248f77c24c77db171d8d8f92ded41a3d08abe700fae862c56388,
            0x64fd412d90b56a9768da2fc272bfb77133ff5a34773eda9a574e408b0f910c6,
            0x2c0b8512349560d4e525dfb8ad3aff88aecec1b8250b241ce3381bb5bfb54b1,
            0x3e4396b03877bf8bb1bc31e1886d1c4ea0ee47296bf57414f67692e169b73b0,
            0x1861499b635cd3cd1ed2571371e5c56f0e1fef2755d9a765d7328c521a16a2,
            0x2f9a776aed30d303293e17bcc5170f713e9751eda0fae1629812fe733fe38f0,
            0x42fa4b9e1f0f569b86c164b708d858da84f2cf240104aa039d54067babb231f,
            0x3cd3e3f5e3b3b238100159440bae13ed264f51aeff9823f5e8033026fd777ea,
            0x2eb9ae455bf6210e2de321f73b5f37add0618448e089ead96ed9fcffbb69bc1,
            0x6e8ad2c63cd8a5cead3066b185167f8aee010a2a846d567296047b22eab8fe6,
            0x6fdf0aae7a5f0927f25f714e2ff98f03b32caebf99822fb4c983e4ba996075f,
            0x3c77e3e5a66ff58a256006867df8f9fb1c7e4553b439e2097291fe79224535c,
            0x60caf908e8f2c0f449b5fec901450ba5f1c805689c4f77db4ff61bc0fa818e7,
            0x4ca8c56c2a36c70f8ed4f25404592d99b5b94ee51970c2ae4a69fc30f172580,
            0x431b362ca88f8f8f7a3bc1cdf6529b28b17a4f2f6de98537793a724095d036a,
            0x1c16d7a4e0aed452afb9f580995846f9af26ca9575c22ef4d90cc51deff4be6,
            0x5bfe05e0ba36908a1e7296c1f30e0ebf0d8a7a1a84a9cb5c7c609d6c80a7a45,
            0x4b3822d641a1d7874c2fa55e47c0bacbfb7294fbefca425abd787421ba66a58,
            0x346dfa5cc80e4b35e2b0d55370728abe354f80239a83c51ad5d55339b6c268,
            0xdaf40bb733fed2bd6eda8cc7df488eab5389b113be11b94960447e64a92a15,
            0x658ea1fe19f665aa006fa3f0512fb0c1b218ef3c041796809ccc4055d5ec613,
            0x4d02f29854b5884153bf7bcd8ebc67b7e5ffc6e8e107963d5acc05d9e6177da,
            0x263342263c8a22f7e62d985602695e7ad69508e2e49c110fb337e1da15f4db7,
            0x4ca9b18b1a8dfd4e103b843abbe8a18feb8e893e98b96b3f1eeb59dd67dce70,
            0x966b2a03b2b6f640c10f51a16f4f24ebee3aebf50c860596ed0f1c14bf189e,
            0x7f18edebfc81445bcb6960c4440f270253b0d42013cae06ac1e3415f2863f02,
            0x4b245f31c75ec669a660ca7badec791b8e9faf69f8f5a4c40e5dd4d103fd81b,
            0x52e26347ac586acc3f25a2147af2a08e447d70073c50f3d6aea2b67750cf9bf,
            0x4fd6e8213805aab498a3f769a632ddec333aa1beb98e809a9f22dfd7c2ec174,
            0x53c8a4ea9557a36c25b2381fa3a153205b5ef6110f6f7e96f58d9063b68e6c0,
            0x6a51fca01e35afdac5fb1314eac4d8739ceb88dc733ca976de1fcf77d920de9,
            0xbf27bcf79653fabbb659282405585f2bcf6f82844c53129fcee638c2b44b62,
            0x3719b628054997c79ae6cef02f3a90d661ac45f4355679aea3360efb7ea0644,
            0x7061c2e279b5778defaae5d191187a795a0730d68b947c76aa74f576cac3d9,
            0x64994276c0e30294bf51097b3ffee686dc75f5cdf5f605f61ba94bd2499b1da,
        ]
            .span(),
        fri: stone_proof_fibonacci_keccak::fri::commitment::get(),
    };
}
