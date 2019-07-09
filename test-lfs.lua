
local lfs = require './init.lua'
local fs  = require 'fs'

require('tap')(function(test)
    test('lfs.mkdir should make directory', function()
        lfs.mkdir('mkdir_test.d')
        
        local stat = assert(fs.statSync 'mkdir_test.d')

        assert(stat.type == 'directory', '`mkdir_test.d` is not a directory')
        assert(stat.mode == 17157, 'mode is not 755')

        fs.rmdirSync 'mkdir_test.d'
    end)

    test('lfs.rmdir should remove directory', function()
        fs.mkdirSync 'rmdir_test.d'

        assert(lfs.rmdir('rmdir_test.d'))
        assert(not fs.existsSync 'rmdir_test.d', 'directory not removed')
    end)

    test('lfs.rmdir should fail on invalid path', function()
        assert(not lfs.rmdir('/im_an_invalid_path'))
    end)

    test('lfs.chdir should change cwd', function()
        local old = lfs.currentdir()
        fs.mkdirSync 'test_chdir'

        assert(lfs.chdir('./test_chdir'))
        assert(lfs.currentdir() ~= old)

        assert(lfs.chdir(old))
        fs.rmdirSync './test_chdir'
    end)

    test('lfs.chdir same dir should do nothing', function()
        local success = lfs.chdir(lfs.currentdir())
        
        assert(success == 0)
    end)

    test('lfs.chdir invalid dir should return nil', function()
        local success, _, err = lfs.chdir('/im_an_invalid_path')

        assert(success == nil)
        assert(err == 'ENOENT')
    end)


    test('lfs.setmode should error', function()
        local success, err = pcall(lfs.setmode)

        assert(not success)
        assert(err:find('not implemented'))
    end)

    test('lfs.lock should error', function()
        local success, err = pcall(lfs.lock)

        assert(not success)
        assert(err:find('not implemented'))
    end)

    test('lfs.lock_dir should error', function()
        local success, err = pcall(lfs.lock_dir)

        assert(not success)
        assert(err:find('not implemented'))
    end)

    test('lfs.unlock should error', function()
        local success, err = pcall(lfs.unlock)

        assert(not success)
        assert(err:find('not implemented'))
    end)

end)