'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "66f6d578bcb34a144c814c456c23d60f",
"assets/AssetManifest.bin.json": "234b116905a51293d1aaf0bcb2ae38da",
"assets/AssetManifest.json": "34140b87096cf97b9fad8eca4fab417f",
"assets/assets/album1.jpg": "8d6624c8d18c2d2fa26d59e31e069a40",
"assets/assets/album10.jpg": "ed54571b47cb3246d3d827d0e8a8f860",
"assets/assets/album11.jpg": "a0b95e9e70b4e76596179711c11a6032",
"assets/assets/album12.jpg": "e0912071deaeff6391808e37facf7223",
"assets/assets/album13.jpg": "e44e3ab15a386dcf4c8a71fd1865686b",
"assets/assets/album16.jpg": "b885f2bb95bc47ecef37865916a19479",
"assets/assets/album17.jpg": "09aa4c7569a2e0d9c33686ccc0e3d9dd",
"assets/assets/album18.jpg": "0a64cee54bc21dcc7e4c368893e390f7",
"assets/assets/album19.jpg": "a9904967eaf870dd94db5aaa087a22f2",
"assets/assets/album2.jpg": "5292c4e40964e48543e809cb0d5edaff",
"assets/assets/album20.jpg": "116d298da08fbad0c44c2916dcf7a426",
"assets/assets/album3.jpg": "69cfdfb341c29cc3bb262fad227b8034",
"assets/assets/album4.jpg": "8030242fb80f59e7f94b8de758d8ac3b",
"assets/assets/album5.jpg": "b20e010326fbc8ef8934654caaba4e1e",
"assets/assets/album7.jpg": "dabd3030c8d68b92562fb35d88425d92",
"assets/assets/album8.jpg": "ce2ae62cacbe3bac7d006bed4cbaf63a",
"assets/assets/album9.jpg": "dfee9bb35a20c893a378c24d59ff47e0",
"assets/assets/ciencia.jpg": "7f2e3104a91c2e074047331e53fb8de2",
"assets/assets/ciencia.png": "733b51346b42465f3cef98e1ead0f3b7",
"assets/assets/grim.pdf": "9793701882ac625b02492ddc51bafefc",
"assets/assets/lj.jpg": "941686907d9c614bf16501698438b382",
"assets/assets/Logo.png": "7ad98b95612b69ee762cb81dbcd42b31",
"assets/assets/misterio.png": "bea82f20b4b1cb6e2c4384fb4e674c89",
"assets/assets/romance.png": "17141d76d11f137bd1de0e317c88897a",
"assets/assets/terror.jpg": "5f24e6d7ba736568e287e92a0a19b1e4",
"assets/assets/top50.jpg": "47e83cda166e6e085915ee027b1d1159",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "47fe35b3686270fdb5315de8458f94ad",
"assets/NOTICES": "5a59192b7f0c7a9b106f6ecc222a04e5",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "e1bf96e395b9e2c497ebcb85a31d1970",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Logo.png": "7ad98b95612b69ee762cb81dbcd42b31",
"index.html": "3d874ae091e5d46ccd5ec9ab67d8a105",
"/": "3d874ae091e5d46ccd5ec9ab67d8a105",
"Logo.png": "7ad98b95612b69ee762cb81dbcd42b31",
"main.dart.js": "ccf2b0094ec2082d4a2e16e0783ca419",
"manifest.json": "42c1ad8855d826b3ab9e3f7e5cc7e9af",
"version.json": "247d5e5241d533ac3ac0cc56c2b82f1a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
